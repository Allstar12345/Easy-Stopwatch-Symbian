/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1

Rectangle{
    Component.onCompleted: {completeddio.opacity=1;}
    Behavior on opacity{NumberAnimation{}}
    color: "black"
    opacity: 0
    id: completeddio
    anchors{fill:parent}
    z: 5
    Timer{id: killtimer;interval: 400;onTriggered:{completeddio.destroy();}}
    MouseArea{
        anchors.fill: parent
        onClicked:{
            audio.stop();
            completeddio.opacity=0;
            killtimer.start();
            window.title= "Easy Stopwatch"
        }
    }
Image{
anchors.verticalCenterOffset: -60
anchors.verticalCenter: parent.verticalCenter
anchors.horizontalCenterOffset: 0
anchors.horizontalCenter: parent.horizontalCenter
source: "warning_icon.svg"
}
    Text {
        id: text1
        x: 49
        y: 275
        color: "#ffffff"
        text: qsTr("Countdown Completed")
        anchors.verticalCenterOffset: 90
        styleColor: "#ffffff"
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 29
    }
}
