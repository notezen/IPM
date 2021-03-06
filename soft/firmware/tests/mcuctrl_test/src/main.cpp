
#include "mcu_ctrl.h"

#include <iostream>
#include <sstream>
#include <boost/regex.hpp>

int main( int argc, char * argv[] )
{
    McuCtrl c;
    bool res = c.open();
    if ( !res )
        return 1;

    const int cnt = 2;
    unsigned long v[ cnt ];
    res = c.inputs( v, cnt );
    res = c.inputs( v, cnt );
    res = c.inputs( v, cnt );

    /*std::string stri;
    stri.resize( 128 );
    int cnt;
    cnt = c.read( stri );
    cnt = c.write( "mem\r\n" );
    cnt = c.read( stri );
    std::cout << stri;
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "st\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "out 0 0\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "out 1 1\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "st\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "st\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "st\r\n" );
    cnt = c.read( stri );
    std::cout << stri;*/


    /*cnt = c.write( "i2c_set_buffer 1 3 2 1\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "i2c_set_master 0\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "i2c_io\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "i2c_io\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "i2c_io\r\n" );
    cnt = c.read( stri );
    std::cout << stri;

    cnt = c.write( "i2c_buffer 4\r\n" );
    cnt = c.read( stri );
    std::cout << stri;*/

    return 0;
}

