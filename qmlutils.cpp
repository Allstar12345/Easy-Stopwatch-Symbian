// Copyright (C) 2020 Allstar Software (Paul Wallace)

#include "qmlutils.h"
#include <QtCore/QDateTime>
#include <QtGui/QApplication>
#include <QtGui/QClipboard>
#include <QtGui/QImage>
#include <QtGui/QStyleOptionGraphicsItem>
#include <QtGui/QPainter>
#include <QtGui/QDesktopServices>
#include <QtDeclarative/QDeclarativeItem>
#include <QtDeclarative/QDeclarativeView>
#include <QtDeclarative/QDeclarativeEngine>
#include <QtNetwork/QNetworkAccessManager>
#include <MAknFileFilter.h>
#include <f32file.h>
#include <QProcess>
#include <AknGlobalNote.h>
#include <avkon.mbg>
#include <hwrmlight.h>

QMLUtils::QMLUtils(QDeclarativeView *view, QObject *parent) :
    QObject(parent), m_view(view), clipboard(QApplication::clipboard())
{
    light = CHWRMLight::NewL();
     notifyLight = CHWRMLight::NewL();
}
bool running;

void QMLUtils::copyToClipboard(const QString &text)
{
#ifdef Q_WS_SIMULATOR
    qDebug("Text copied to clipboard: %s", qPrintable(text));
#endif
    clipboard->setText(text, QClipboard::Clipboard);
    clipboard->setText(text, QClipboard::Selection);
}



void QMLUtils::minimizeApp() const
{
#ifdef Q_OS_SYMBIAN
    m_view->lower();
#else
    qWarning("QMLUtils::minimizeApp(): this function only works on Symbian");
#endif
}



void QMLUtils::restartApp() const{
    QProcess::startDetached (QApplication::applicationFilePath());
    exit(12);
}
void QMLUtils::blinkLight() const {
    notifyLight->LightBlinkL(CHWRMLight::EPrimaryKeyboard, KHWRMInfiniteDuration, 1, 1, KHWRMLightMaxIntensity);
    notifyLight->LightBlinkL(CHWRMLight::ECustomTarget1, KHWRMInfiniteDuration, 1, 1, KHWRMLightMaxIntensity);
}
void QMLUtils::blinkLightOneBut() const {
    notifyLight->LightBlinkL(CHWRMLight::ECustomTarget1, 20000, 1, 1, KHWRMLightMaxIntensity);
}







