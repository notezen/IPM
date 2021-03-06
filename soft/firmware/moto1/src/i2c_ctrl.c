
#include <stdlib.h>

#include "i2c_ctrl.h"
#include "hal.h"
#include "chprintf.h"

#include "read_ctrl.h"
#include "write_ctrl.h"
#include "led_ctrl.h"
#include "hdw_config.h"

static const I2CConfig i2cfg1 =
{
    OPMODE_I2C,
    100000,
    STD_DUTY_CYCLE,
};

static Mutex    mutex;

static WORKING_AREA( waI2c, 256 );
static msg_t i2cThread( void *arg )
{
    (void)arg;
    chRegSetThreadName( "i" );

    static msg_t status;
    static systime_t tmo;
    tmo = MS2ST( 100 );
    // I/O with other boards.
    static uint32_t dataOut;
    static uint32_t dataIn;

    static uint8_t addr;
    do {
        // Read ADDRESS pins.
        uint16_t ind = palReadPad( ADDR_PORT, ADDR_0 ) |
                     ( palReadPad( ADDR_PORT, ADDR_1 ) << 1 ) |
                     ( palReadPad( ADDR_PORT, ADDR_2 ) << 2 );
        ind = (~ind) & 0x0007;
        addr = I2C_BASE_ADDR + 2 * ind + 1;

        dataIn = valueRead();
        status = i2cSlaveIoTimeout( &I2CD1, addr,
                                    (uint8_t *)&dataOut,  sizeof( dataOut ),
                                    (uint8_t *)&dataIn,   sizeof( dataIn ),
                                    NULL, NULL,
                                    tmo );
        if ( status != RDY_OK )
        {
            i2cStart( &I2CD1, &i2cfg1 );
        }

    } while ( status != RDY_OK );

    while ( 1 )
    {
        chThdSleepMilliseconds( 20 );

        dataIn = valueRead();
        valueWrite( dataOut );
    }

    return 0;
}

void initI2c( void )
{
    // Address pins
    palSetPadMode( ADDR_PORT, ADDR_0, PAL_MODE_INPUT );
    palSetPadMode( ADDR_PORT, ADDR_1, PAL_MODE_INPUT );
    palSetPadMode( ADDR_PORT, ADDR_2, PAL_MODE_INPUT );
    palSetPadMode( GPIOB, 6, PAL_MODE_STM32_ALTERNATE_OPENDRAIN );
    palSetPadMode( GPIOB, 7, PAL_MODE_STM32_ALTERNATE_OPENDRAIN );
    chThdSleepMilliseconds( 100 );

    i2cStart( &I2CD1, &i2cfg1 );

    // Initializing mutex.
    chMtxInit( &mutex );
    // Creating thread.
    chThdCreateStatic( waI2c, sizeof(waI2c), NORMALPRIO, i2cThread, NULL );
}












