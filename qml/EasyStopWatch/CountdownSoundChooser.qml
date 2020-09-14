/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1
import QtMultimediaKit 1.1
import "Settings.js" as Setting

ContextMenuer{
    id: root

    Component.onCompleted: {
        open()}
        onStatusChanged: {
            if (status === DialogStatus.Closing) __isClosing = true
            else if (status === DialogStatus.Closed && __isClosing) root.destroy()
        }
        property bool __isClosing: false
MenuLayout{
    Audio{id: testaud; volume: 0.5}
    Audio{id: testaudcustom;volume: 0.5; source:Setting.get("customsound")}
    MenuItem{
        id: custom
        text: if(Setting.get("customsoundtext")===""){"No Custom Sound"} else{testaudcustom.metaData.title}
        onClicked:{
            if(Setting.get("customsound")===""){QMLUtils.caKnLong("", "Please Choose A sound")} else{Setting.set("sound", Setting.get("customsound"));  QMLUtils.caKnLong("Sound Set", Setting.get("sound")); audio.source=Setting.get("sound");}

        }
       Rectangle{width: butrow.width-4;height: butrow.height-10; smooth: true; radius: 15; z: 10;anchors.centerIn: butrow; color: "black"}
        ButtonRow{
            id: butrow
            z: Infinity
            anchors.right: parent.right; anchors.rightMargin: 5; anchors.verticalCenter: parent.verticalCenter
            ToolButton{id: customplay; enabled: Setting.get("customsound")==="" ? false: true;iconSource: testaudcustom.playing?"toolbar-mediacontrol-stop": "toolbar-mediacontrol-play"; onClicked: { if(testaudcustom.playing===true){testaudcustom.stop()} else{testaudcustom.source=Setting.get("customsound"); testaudcustom.play();}}}
            ToolButton{iconSource: "img/memory.svg"; onClicked: {fileChooser(); if(fileurl===""){QMLUtils.caKnLong("No file chosen", "")}else{Setting.set("sound", "file:///"+ fileurl);  Setting.set("customsound", "file:///"+ fileurl);audio.source="file:///"+fileurl; Setting.set("customsoundtext", "true");testaudcustom.source="file:///"+fileurl; customplay.enabled=true;QMLUtils.caKnLong("Audio Selected",""); console.debug(testaudcustom.metaData.title)}}
   }
        }
    }
    MenuItem{
        text:"Sound 1"
        onClicked: {audio.source="file:///e:/Resource/EasyStopWatch/completedsound.mp3";
            Setting.set ("sound","file:///e:/Resource/EasyStopWatch/completedsound.mp3")
           QMLUtils.caKnLong("Sound set to:", "Sound 1")}
        ToolButton{height: 60; width: 60; anchors.right: parent.right; anchors.rightMargin: 5; iconSource: "toolbar-mediacontrol-play"; onClicked: {testaud.source="file:///e:/Resource/EasyStopWatch/completedsound.mp3"; testaud.play();}}

    }
    MenuItem{
        text:"Sound 2"
        onClicked: {audio.source="file:///e:/Resource/EasyStopWatch/1.aac";
            Setting.set ("sound","file:///e:/Resource/EasyStopWatch/1.aac")
           QMLUtils.caKnLong("Sound set to:", "Sound 2")}
        ToolButton{height: 60; width: 60; anchors.right: parent.right; anchors.rightMargin: 5; iconSource: "toolbar-mediacontrol-play"; onClicked: {testaud.source="file:///e:/Resource/EasyStopWatch/1.aac"; testaud.play();}}

    }
    MenuItem{
        text:"Sound 3"
        onClicked: {audio.source="file:///e:/Resource/EasyStopWatch/2.aac";
            Setting.set ("sound","file:///e:/Resource/EasyStopWatch/2.aac")
           QMLUtils.caKnLong("Sound set to:", "Sound 3")}
        ToolButton{height: 60; width: 60; anchors.right: parent.right; anchors.rightMargin: 5; iconSource: "toolbar-mediacontrol-play"; onClicked: {testaud.source="file:///e:/Resource/EasyStopWatch/2.aac"; testaud.play();}}

    }
    MenuItem{
        text:"Sound 4"
        onClicked: {audio.source="file:///e:/Resource/EasyStopWatch/3.aac";
            Setting.set ("sound","file:///e:/Resource/EasyStopWatch/3.aac")
           QMLUtils.caKnLong("Sound set to:", "Sound 4")}
        ToolButton{height: 60; width: 60; anchors.right: parent.right; anchors.rightMargin: 5; iconSource: "toolbar-mediacontrol-play"; onClicked: {testaud.source="file:///e:/Resource/EasyStopWatch/3.aac"; testaud.play();}}

    }
    MenuItem{
        text:"Sound 5"
        onClicked: {audio.source="file:///e:/Resource/EasyStopWatch/4.aac";
            Setting.set ("sound","file:///e:/Resource/EasyStopWatch/4.aac")
           QMLUtils.caKnLong("Sound set to:", "Sound 5")}
        ToolButton{height: 60; width: 60; anchors.right: parent.right; anchors.rightMargin: 5; iconSource: "toolbar-mediacontrol-play"; onClicked: {testaud.source="file:///e:/Resource/EasyStopWatch/4.aac"; testaud.play();}}

    }



}

}
