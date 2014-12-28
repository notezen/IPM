
#ifndef __MCU_CTRL_H_
#define __MCU_CTRL_H_

#ifdef EMUL
    #include "emul_usb_io.h"
#else
    #include "usb_io.h"
#endif

class McuCtrl: public UsbIo
{
public:
    McuCtrl();
    ~McuCtrl();

    bool inputs( unsigned long * data, int len = 2 );
    bool setOutputs( unsigned long * data, int len = 2 );

    bool accInit();
    bool accAcc( int & x, int & y, int & z );
    bool accMag( int & x, int & y, int & z );
    bool accTemp( int & t );

    bool i2cSetAddr( int addr );
    bool i2cSetBuf( int start, unsigned char * data, int cnt );
    bool i2cIo( int txCnt, int rxCnt );
    bool i2cStatus( int & status );
    bool i2cBuffer( int cnt, unsigned char * data );
};


#endif





