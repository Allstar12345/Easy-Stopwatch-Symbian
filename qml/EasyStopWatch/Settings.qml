/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1

import "Settings.js" as Setting

Rectangle{
    QtObject { id: create; property Component com: null;function createComponent (qmlfile){com = Qt.createComponent(qmlfile);com.createObject(settings)} }
    id: settings
    color: "black"
    Component.onCompleted: {settings.opacity=1;}
    anchors{fill:parent}
    opacity:0
    z:5
    visible: true
    MouseArea{anchors.fill: parent}
    Behavior on opacity{NumberAnimation{}}
    Timer{id:killtimer;interval: 400;onTriggered:{settings.destroy();}}
    property string fileurl: ""

    function fileChooser (){
        var test=QMLUtils.getFile()
        if(test=="") console.debug("empty")
        else fileurl=test;}
 function openReset(){create.createComponent(Qt.resolvedUrl("ResetApplicationDialog.qml")); }
    function openSoundChooser(){create.createComponent(Qt.resolvedUrl("CountdownSoundChooser.qml")); }



 BottomBar{
     id:toolbar
     ToolButton{
         anchors.left: parent.left
         anchors.verticalCenter: parent.verticalCenter
         iconSource: "toolbar-back"
         onClicked: {Setting.set("volume", audio.volume);settings.opacity=0;killtimer.start();}
     }
 }

    ListHeading {
        id: sectionHeading
        z: 1

        ListItemText {
            id: headingText
           anchors.centerIn: parent
            role: "Heading"
            text: "Settings"
        }
    }

    Flickable {
       id: flickable1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: sectionHeading.bottom
        anchors.bottom: toolbar.top
        contentHeight: col.height
        contentWidth: col.width

    Column {
       spacing: 1
       id: col


       ListItem{
           enabled: false
           ListItemText {
               id: notifier
              anchors.centerIn: parent
               role: "Heading"
               text: "Alert Volume:"
           }
       }

       ListItem {
            id: volume
            enabled: false
            Slider{id: slider; anchors{right: parent.right; left: parent.left;horizontalCenter: parent.horizontalCenter;verticalCenter: parent.verticalCenter} value: audio.volume; maximumValue: 1.0; minimumValue: 0.0; valueIndicatorVisible: true;valueIndicatorText: Math.round(value*100)+"%"
               onValueChanged: {
                   if (pressed)audio.volume= value
               }
               Binding {
                           when: !slider.pressed
                           target: slider
                           property: "value"
                           value: audio.volume
                       }
           }
            }
       ListItem {
            id: intervalb
            enabled: false
            ListItemText {
                role: "Title"
                text: "Interval Beep (30 Seconds)"
                anchors.fill: intervalb.paddingItem
            }


            Switch{
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                checked: Setting.get("intervalbep")===""? false:true
                onClicked: {
                    if(Setting.get("intervalbep")===""){beep.volume=0.75
                        Setting.set("intervalbep", true)
                        QMLUtils.caKnLong("", "Interval Beep Enabled")}
                    else{beep.volume=0.00
                        Setting.set ("intervalbep", "")
                        QMLUtils.caKnLong("", "Interval Beep Disabled")}
                }
            }
       }
       ListItem {
            id: scroll
            enabled: false
            ListItemText {
                role: "Title"
                text: "Lap ScrollBar Interactive"
                anchors.fill: scroll.paddingItem
            }


            Switch{
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                checked: set_scroll
                onClicked: {
                   set_scroll = checked;
                   Setting.set("scroll",checked)
                }
            }
       }
       ListItem {
            id: colourText
            enabled: false
            ListItemText {
                role: "Title"
                text: "Stopwatch Text Colours"
                anchors.fill: colourText.paddingItem
            }


            Switch{
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                checked: Setting.get("colourfulText")===""? true: false
                onClicked: {
                    if(Setting.get("colourfulText")===""){Setting.set("colourfulText", "false"); colourfulTimerText=true}
                    else{Setting.set("colourfulText", ""); colourfulTimerText=false}

                }
            }
       }
       ListItem {
            id: rumblel
            enabled: false
            ListItemText {
                role: "Title"
                text: "Vibrate on Countdown"
                anchors.fill: rumblel.paddingItem
            }


            Switch{
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                checked: Setting.get("vibra")===""? true: false
                onClicked: {
                    if(Setting.get("vibra")===""){Setting.set("vibra", "false"); rumble.duration=0} else{Setting.set("vibra", ""); rumble.duration=2000 }
                }
            }
       }
       ListItem {
            id: exitdio
            enabled: false
            ListItemText {
                role: "Title"
                text: "Close Dialog Enabled"
                anchors.fill: exitdio.paddingItem
            }


            Switch{
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                checked: Setting.get("exitdio")===""? true: false
                onClicked: {
                    if(Setting.get("exitdio")===""){Setting.set("exitdio", "false")} else{Setting.set("exitdio", "")}
                }
            }
       }
       ListItem{
           enabled: true
           subItemIndicator: true
           onClicked:{openSoundChooser()}
           ListItemText {
               id: notifier2
           anchors.fill: parent.paddingItem
               role: "Title"
               text: "Countdown Sound"
           }
       }
       ListItem {
            id: resetall
            enabled: true
            onClicked:{
                openReset();
            }

            ListItemText {
                role: "Title"
                text: "Reset Easy StopWatch"
                anchors.fill: resetall.paddingItem
            }
    }
    }

}
}


