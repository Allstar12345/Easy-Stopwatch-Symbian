/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1

Rectangle {
z:5
anchors{left:parent.left; right:parent.right}
color: "black"
height:screen.height===360? 43: 53
property bool paddingLine
signal clicked
visible: true
id:root
property alias itemText: text.text
property alias imageSource: image.source
Rectangle{id: padding;height:1;color: "white"; anchors{top:parent.bottom;left:parent.left;right:parent.right}z:1; visible: paddingLine}
Image{ anchors.leftMargin: e6? 0: 2; anchors.left:parent.left;anchors.verticalCenter: parent.verticalCenter; id: image;smooth:true}
Text{Behavior on font.pointSize {NumberAnimation{}}anchors.centerIn:parent; color: "white"; font.bold: true; font.pointSize: mouse.pressed? 7: 8; id: text}
MouseArea{id: mouse;
    anchors.fill: parent
    onClicked:{root.clicked(); close();}
}
}
