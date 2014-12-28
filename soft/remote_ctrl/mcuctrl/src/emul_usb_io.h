
#ifndef __EMUL_USB_IO_H_
#define __EMUL_USB_IO_H_

#include <string>

class UsbIo
{
public:
    UsbIo();
    virtual ~UsbIo();
    bool open( const std::string & arg = std::string() );
    void close();
    bool isOpen() const;

    // Low level read/write functionality.
    int write( const std::string & stri );
    int read( std::string & stri );
    int setTimeout( int ms );

    void msleep( int ms );
private:
    std::string for_read;
};

#endif



