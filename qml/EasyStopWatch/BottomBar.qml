/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
Rectangle{z: 5;id: toolbar;anchors{right: parent.right;left: parent.left;bottom: parent.bottom}color:"black"; height: e6? 52: 70
    PropertyAnimation{id: appeara; to: 0; property:"anchors.bottomMargin"; target: toolbar}
    PropertyAnimation{id: disappear; to: e6? -52:-70; property:"anchors.bottomMargin" ;target: toolbar}
    function show(){appeara.start();}
    function hide(){disappear.start();}
}
