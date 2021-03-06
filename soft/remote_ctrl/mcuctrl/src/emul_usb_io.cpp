
#include "emul_usb_io.h"
#include <string.h>
#include <iostream>
#include <stdlib.h>
#include <sstream>

#ifdef WIN32
    #include <windows.h>
    #define  delay( arg ) Sleep( arg )
#else
    #include <unistd.h>
    #define delay( arg ) usleep( 1000 * (arg) )
#endif


UsbIo::UsbIo()
{
    for(int i=0;i<3;i++)
        inputs[i]=1;
}

UsbIo::~UsbIo()
{
}

bool UsbIo::open( const std::string & arg )
{
    std::cout<<"emul_usb_io OPEN\n";
    return true;
}

void UsbIo::close()
{
    std::cout<<"emul_usb_io CLOSE\n";
}

bool UsbIo::isOpen() const
{
    return true;
}

int UsbIo::write( const std::string & stri )
{
    std::ostringstream inp;

    for_read.assign(stri);

    inp<<"{"<< inputs[0] << " "<< inputs[1] <<" "<< inputs[2] << "}";

    if(stri.compare("st\r\n")==0)
    {
        for_read.insert(0, inp.str());
    }
    else
    {
        if(stri.compare("status\r\n")==0)
            for_read.assign("ok:{0}<\r\n");

        std::cout<<"emul_usb_io WRITE: ";
        std::cout<<stri;

        inputs[0]++;
    }

    return stri.size();
}

int UsbIo::read( std::string & stri )
{
    stri.assign(for_read);
    for_read.clear();

    return stri.size();
}

int UsbIo::setTimeout( int ms )
{
    return 0;
}

void UsbIo::msleep( int ms )
{
    delay( ms );
}
