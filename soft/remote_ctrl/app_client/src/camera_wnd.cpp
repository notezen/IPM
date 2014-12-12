
#include "camera_wnd.h"

CameraWnd::CameraWnd( QWidget * parent )
: QWidget( parent )
{
   setMinimumSize( 320, 240 );

    //preparation of the vlc command
    const char * const vlc_args[] = {
              //"--sout-qsv-software",  // No hardware decoding.
              "--no-overlay",         // No hardware acceerated overlay output.
              "-I", "dummy",          /* Don't use any interface */
              "--ignore-config",      /* Don't use VLC's config */
              //"--extraintf=logger", //log anything
              //"--verbose=2", //be much more verbose then normal for debugging purpose
                "--no-xlib"
    };

    _videoWidget=new QFrame(this);


    QVBoxLayout *layout = new QVBoxLayout;
    layout->addWidget(_videoWidget);
    setLayout(layout);

    //create a new libvlc instance
    _vlcinstance=libvlc_new(sizeof(vlc_args) / sizeof(vlc_args[0]), vlc_args);  //tricky calculation of the char space used

    // Create a media player playing environement
    _mp = libvlc_media_player_new (_vlcinstance);

}

//desctructor
CameraWnd::~CameraWnd()
{
    /* Stop playing */
    libvlc_media_player_stop (_mp);

    /* Free the media_player */
    libvlc_media_player_release (_mp);

    libvlc_release (_vlcinstance);
}

void CameraWnd::playFile(QString file)
{
    if (isPlaying())
        stop();

    /* Create a new LibVLC media descriptor */
    _m = libvlc_media_new_path(_vlcinstance, file.toAscii());

    libvlc_media_player_set_media (_mp, _m);

    // /!\ Please note /!\
    //
    // passing the widget to the lib shows vlc at which position it should show up
    // vlc automatically resizes the video to the ?given size of the widget
    // and it even resizes it, if the size changes at the playing

    /* Get our media instance to use our window */
    #if defined(Q_OS_WIN)

        //libvlc_media_player_set_drawable(_mp, reinterpret_cast<unsigned int>(_videoWidget->winId()));
        libvlc_media_player_set_hwnd(_mp, _videoWidget->winId() ); // for vlc 1.0

    #else //Linux

        int windid = _videoWidget->winId();
        libvlc_media_player_set_xwindow (_mp, windid );

    #endif

    /* Play */
    libvlc_media_player_play (_mp);
}

void CameraWnd::stop()
{
    libvlc_media_player_stop( _mp );
}

bool CameraWnd::isPlaying()
{
    bool res = ( libvlc_media_player_is_playing( _mp ) > 0 );
    return res;
}
