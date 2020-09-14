/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1

Menu{
    id: menu
    Component.onCompleted:{
        open()
    }

    property bool __isClosing: false

 onStatusChanged: {
     if (status === DialogStatus.Closing) __isClosing = true
     else if (status === DialogStatus.Closed && __isClosing) menu.destroy()
 }
    MenuLayout{


        MenuItem{
            text: "Countdown"
            onClicked: {
                 pageStack.push(countdown)
            }
        }
        MenuItem{
            text: "Settings"
            platformSubItemIndicator: true
            onClicked: {
                 pageStack.push(Qt.resolvedUrl("Settings.qml"))
            }
        }

        MenuItem{
            id: largemodemenu
            visible: normalviewbutton.visible?  false: true
            text: "Large Mode"
            onClicked:{
                lapListView.anchors.bottom= stop.top
                lapListView.anchors.bottomMargin= 15
                bigstartpause.visible= true
                stopapp.start();
                startapp.start();
                lapapp.start();
                toolbarplay.visible= false
                toolbarstop.visible= false
                toolbarlap.visible= false
                normalviewbutton.visible= true
                largemodemenu.visible= false
            }
        }


            MenuItem{
                text: "Exit"
                onClicked: {
                    if (closeDialog.enabled === true){
                        closeDialog.open()
                    }
                    else{
                        Qt.quit();
                    }
                }
        }
}
}
