/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1

CommonDialoger {
    Component.onCompleted: {
        open()}
        enabled: true
        onStatusChanged: {
            if (status === DialogStatus.Closing) __isClosing = true
            else if (status === DialogStatus.Closed && __isClosing) closeDialog.destroy()
        }
        property bool __isClosing: false
        id: closeDialog
        titleText: "Exit"
        privateCloseIcon: true
        buttonTexts: ["Yes", "Minimize"]
        content: Label { anchors.centerIn: parent; text: "Are you sure you want to leave?";}
        onButtonClicked: {
            if (index === 0) Qt.quit()
                   else if (index === 1) QMLUtils.minimizeApp()
    }
}
