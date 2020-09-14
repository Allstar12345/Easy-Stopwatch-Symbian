// Copyright (C) 2020 Allstar Software (Paul Wallace)

#ifndef QMLUTILS_H
#define QMLUTILS_H

#include <QtCore/QObject>
#include <akndiscreetpopup.h>
#include <aknnotewrappers.h>
#include <hwrmlight.h>
#include <QFileDialog>

class QClipboard;
class QDeclarativeItem;
class QDeclarativeView;
class QMLUtils : public QObject
{
    Q_OBJECT
public:
    explicit QMLUtils(QDeclarativeView *view, QObject *parent = 0);
    Q_INVOKABLE void copyToClipboard(const QString &text);
    Q_INVOKABLE void minimizeApp() const;
    Q_INVOKABLE void blinkLight() const;
    Q_INVOKABLE void blinkLightOneBut() const;
    Q_INVOKABLE void restartApp() const;
    Q_INVOKABLE void caKnLong(QString title, QString content){
        TPtrC16 stitle(reinterpret_cast<const TUint16*>(title.utf16()));
         TPtrC16 scontent(reinterpret_cast<const TUint16*>(content.utf16()));
        TRAP_IGNORE(CAknDiscreetPopup::ShowGlobalPopupL(stitle, scontent,KAknsIIDNone, KNullDesC, 0, 0, KAknDiscreetPopupDurationLong));
    }

    Q_INVOKABLE QString getFile(){
        return QFileDialog::getOpenFileName(0, "Choose your sound file", "", "Sound files (*.mp3 *.wav *.m4a)");
    }



private:
    QDeclarativeView *m_view;
        QClipboard *clipboard;
        CHWRMLight* light; // Light control
            CHWRMLight* notifyLight;

};

#endif // QMLUTILS_H
