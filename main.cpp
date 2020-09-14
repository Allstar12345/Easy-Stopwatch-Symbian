// Copyright (C) 2020 Allstar Software (Paul Wallace)
#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtGui/QPixmap>
#include <QDeclarativeProperty>
#include <QDir>
#include <QDebug>
#include <QObject>
#include <QtGui/QSplashScreen>
#include <QtGui/QPixmap>
#include <QDeclarativeItem>
#include <QtDeclarative/QDeclarativeContext>
#include <QtDeclarative/QDeclarativeEngine>
#include <QMutex>
#include <QMutexLocker>
#include "qmlutils.h"
#include "utils.h"
#include "mediakeysobserver.h"
int main(int argc, char **argv)

{

    QApplication app(argc, argv);
    QSplashScreen *splash = new QSplashScreen(QPixmap(":/splash/splash.png"));
    splash->showMessage(QSplashScreen::tr("Allstar Software \nEasy StopWatch v1.31"), Qt::AlignHCenter | Qt::AlignBottom, Qt::white);
    splash->show();
    app.setOrganizationName("Allstar Software");
    QDeclarativeView view;
    qmlRegisterType<Utils>("avkonUtils", 1, 0, "AvkonUtils");
    qmlRegisterType<MediaKeysObserver>("MediaKeysObserver", 1, 0, "MediaKeysObserver");
    view.setAttribute(Qt::WA_OpaquePaintEvent);
    view.setAttribute(Qt::WA_NoSystemBackground);
    view.viewport()->setAttribute(Qt::WA_OpaquePaintEvent);
    view.viewport()->setAttribute(Qt::WA_NoSystemBackground);

    QMLUtils qmlUtils(&view);
            view.rootContext()->setContextProperty("QMLUtils", &qmlUtils);
    view.setSource(QUrl("qrc:/qml/EasyStopWatch/main.qml"));

     view.showFullScreen();
    splash->finish(&view);
    splash->deleteLater();
    return app.exec();

}





