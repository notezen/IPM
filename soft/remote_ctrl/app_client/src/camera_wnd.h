
#ifndef __CAMERA_WND_H_
#define __CAMERA_WND_H_

#include <vlc/vlc.h>
#include <QtGui>

class CameraWnd: public QWidget
{
    Q_OBJECT
    QFrame *_videoWidget;

    libvlc_instance_t *_vlcinstance;
    libvlc_media_player_t *_mp;
    libvlc_media_t *_m;

public:
    CameraWnd( QWidget * parent = 0 );
    virtual ~CameraWnd();


public slots:
    void playFile(QString file);
    void stop();
    bool isPlaying();
};

#endif
