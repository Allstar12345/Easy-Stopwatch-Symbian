/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1

Rectangle {
    id: root
    anchors{fill:parent}
    color: "black"
    z: Infinity
    opacity: 0
    Behavior on opacity{NumberAnimation{}}
    function hide(){root.opacity=0}
    function show(){root.opacity=1.0}
    Image{height: sourceSize.height; width: sourceSize.width; sourceSize.height: 16; sourceSize.width: 18;id: volimg; source:audio.volume===0.0? "img/mute.svg" :"img/volume.svg"; anchors{verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 2}}
    ProgressBar{height: 20; minimumValue: 0.0; maximumValue: 1.0; value:audio.volume ;anchors{right:parent.right;left: volimg.right; leftMargin: 2; rightMargin: 4;verticalCenter: parent.verticalCenter}}
}
