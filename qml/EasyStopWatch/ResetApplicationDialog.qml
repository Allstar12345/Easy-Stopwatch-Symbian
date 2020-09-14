/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1
import "Settings.js" as Setting
CommonDialoger {
    function clearall(){
        Setting.clear ("intervalbep")
        Setting.clear ("volume")
        Setting.clear ("sound")
        Setting.clear ("scroll")
        Setting.clear ("exitdio")
        Setting.clear ("vibra")
        Setting.clear("colourfulText")
        Setting.clear("customsound")
        Setting.clear("customsoundtext")
    }
    Component.onCompleted: {
        open()}
        enabled: true
        onStatusChanged: {
            if (status === DialogStatus.Closing) __isClosing = true
            else if (status === DialogStatus.Closed && __isClosing) resetdio.destroy()
        }
        property bool __isClosing: false
        id: resetdio
        titleText: "Reset"
        privateCloseIcon: true
        buttonTexts: ["Yes"]
        content: Label { anchors.centerIn: parent; text: "Are you sure you want to reset?";}
        onButtonClicked: {
            clearall()
            QMLUtils.restartApp();

    }
}
