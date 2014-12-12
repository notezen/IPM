
#ifndef __MAIN_WND_H_
#define __MAIN_WND_H_

#include <QtGui>
#include "peer_qxmpp.h"
#include "ui_main_wnd.h"

class ValveTst;

class MainWnd: public QMainWindow
{
    Q_OBJECT
public:
    MainWnd( QWidget * parent = 0 );
    ~MainWnd();

signals:
    void sigLog( const QString & );
private slots:
    void slotLog( const QString & );
public:
    int print( lua_State * L );
    int joy( lua_State * L );
    ValveTst * valveTst();
private:
    void init( lua_State * L );

    Ui_MainWnd  ui;
    PeerQxmpp * m_peer;
    QTime       m_time;
    QStringList m_logList;

    ValveTst             * m_valveTst;

    static const std::string CLIENT_CONFIG_FILE;
    static const int         LOG_MAX;
    static const QString     VIDEO_CONFIG_FILE;
    static const QString     VIDEO_DEFAULT_ADDR;

    QString                  m_videoUrl;

    QMutex mutex;
    QPointF m_joy1, m_joy2, m_joy3, m_joy4;
public slots:
    void slotSend( const QString & stri );
    void slotVideo();
    void slotConnect();
    void slotExec();
    void slotSendFile();
    void slotHelp();
    void slotJoyChanged( QPointF v, bool mouseDown );

protected:
    void closeEvent(QCloseEvent *event);
};

#endif
