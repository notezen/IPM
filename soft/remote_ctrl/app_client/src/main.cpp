
#include "main_wnd.h"

int main( int argc, char * argv[] )
{
    QApplication app( argc, argv );
    MainWnd * w = new MainWnd();
    w->showMaximized();
    return app.exec();
}


