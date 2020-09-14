
/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
Rectangle{property bool paddingLine; z: 5;id: bar;anchors{right: parent.right;left: parent.left;top:parent.top}color:"black"; height: 35
Rectangle{id: padding;height:0.5;color: "white"; anchors{top:parent.bottom;left:parent.left;right:parent.right}z:1; visible: paddingLine}}
