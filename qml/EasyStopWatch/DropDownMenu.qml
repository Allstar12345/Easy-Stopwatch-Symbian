/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1

Rectangle {
    id:root
    anchors{fill:parent}
    color: "black"
    z: 5
    Timer{id: killtimer; interval: 600; onTriggered: {root.destroy();}}
    function close(){killtimer.start(); disappear.start();root.opacity=0}
    Component.onCompleted:{root.opacity=0.800; appear.start();}
    MouseArea{anchors.fill: parent; onClicked: {close();}}
    Behavior on opacity{NumberAnimation{}}
    SmoothedAnimation{duration: 500; id: appear;to: 0; property:"anchors.topMargin"; target: arearect}
    SmoothedAnimation{duration: 500; id: disappear;to:-329; property:"anchors.topMargin"; target: arearect}
    Rectangle{color:  "black" ;z: 10;id: arearect; clip: true; height:screen.height===360? 258:328;anchors{left: parent.left;right:parent.right;top:parent.top;topMargin:-330}
    Flickable{id: flick; flickableDirection: Flickable.VerticalFlick;anchors.fill: parent; contentWidth: parent.width;contentHeight: 275
        FlickItem{id: n1;anchors.top:parent.top; paddingLine: true;imageSource: "img/countdown.svg"; itemText: "Countdown Timer";onClicked: countdown.opacity=1}
        FlickItem{id: n2;anchors.top: n1.bottom; paddingLine: true;imageSource: "img/settings.svg" ;itemText: "Settings"; onClicked: {opensettings();}}
        FlickItem{id: n3;anchors.top: n2.bottom; paddingLine: true;imageSource: "img/zoom_in.svg"; itemText:lme===""?"Large Mode": "Hide Large Mode";onClicked:{lme===""? largeMode(): hidelargeMode()}}
        FlickItem{id: n4;anchors.top: n3.bottom; paddingLine: true;imageSource: "img/information_userguide.svg"; itemText:"About Easy StopWatch";onClicked: openAbout();}
        FlickItem{id: n5;anchors.top: n4.bottom; paddingLine: true;imageSource: "img/one__click_purchase.svg"; itemText:"Donate To Allstar Software";onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=R8A7782VPR4CN")}
        FlickItem{id: n6;anchors.top: n5.bottom; imageSource: "img/close_stop.svg"; itemText:"Close Easy StopWatch";onClicked: exit();}
       }
    }
}
