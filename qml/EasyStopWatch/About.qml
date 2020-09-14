/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/

import QtQuick 1.1
import com.nokia.symbian 1.1

Rectangle{
    Component.onDestruction: { console.debug ("About Destroyed")}
    Timer{id: killtimer;interval: 500;onTriggered: {about.destroy()}}
    function close(){about.opacity=0;killtimer.start();}
Behavior on opacity { NumberAnimation {} }
scale: 1
color: "black"
anchors.fill: parent
z: 10
opacity: 0
Component.onCompleted: {about.opacity=1}
id: about

BottomBar{
    id: toolbar
    ToolButton {
        anchors.verticalCenter: parent.verticalCenter
        id: btnBack
        iconSource: "toolbar-back"
        onClicked: {close()
     }
  }
}
    Flickable {
        id: flickableabout
        anchors.bottom: toolbar.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        contentHeight: cola.height
        contentWidth: cola.width

        Column {
           spacing: 1
           id: cola
           height:e6? 560: 620

           ListItem {
                id: fuonfb
                enabled: true
                height: 45
                onClicked:
                   Qt.openUrlExternally('http://www.facebook.com/Allstarsoftware')

                ListItemText {
                    anchors.centerIn: parent
                    color: "#33b5e5"
                    role: "Title"
                    text: "Find Me On Facebook"
                }
           }
           ListItem {
                id: fuontwit
                enabled: true
                height: 45
                onClicked:
                   Qt.openUrlExternally('http://www.twitter.com/paulwallace1234')

                ListItemText {
                    color: "#33b5e5"
                    role: "Title"
                    text: "Find Me On Twitter"
                    anchors.centerIn: parent
                }
           }
               ListItem {
                    id: email
                    enabled: true
                    height: 45
                    onClicked:
                       Qt.openUrlExternally('mailto:allstar12345@ovi.com')
                    ListItemText {
                        color: "#33b5e5"
                        role: "Title"
                        text: "Email Me"
                        anchors.centerIn: parent
                    }
               }
               ListHeading {
                   id: sectionHeadingg
                   ListItemText {
                       id: headingTextg
                      anchors.centerIn: parent
                       role: "Heading"
                       text: "Special Thanks To:"
                   }
               }
               ListItem {
                    id: apex
                    enabled: true
                    height: 45
                    onClicked:
                       Qt.openUrlExternally('http://apexdesignsinc.blogspot.co.uk/')
                    ListItemText {
                        color: "#33b5e5"
                        role: "Title"
                        text: "Apex Designs"
                       anchors.centerIn: parent
                    }
               }
               ListItem {
                    id: abdoul
                    enabled: true
                    height: 45
                    onClicked: {
                         Qt.openUrlExternally('http://twitter.com/a_hamameh')
                    }

                    ListItemText {
                        color: "#33b5e5"
                        role: "Title"
                        text: "BelleXDesigns"
                       anchors.centerIn: parent
                    }
               }
               ListItem {
                    id: fab
                    enabled: true
                    height: 45
                    onClicked:
                       Qt.openUrlExternally('https://github.com/huellif')
                    ListItemText {
                        color: "#33b5e5"
                        role: "Title"
                        text: "Huellif"
                       anchors.centerIn: parent
                    }
               }
               ListItem {
                    id: maj
                    enabled: true
                    height: 45
                    onClicked:
                       Qt.openUrlExternally('https://github.com/ksiazkowicz')
                    ListItemText {
                        color: "#33b5e5"
                        role: "Title"
                        text: "Maciej"
                       anchors.centerIn: parent
                    }
               }
               Text {
                   id: txt1
                   width: 312
                   anchors.centerIn: maj
                   height: 21
                   color: "#FFFFFF"
                   text: qsTr("Easy Stopwatch v1.31")
                   anchors.verticalCenterOffset: 45
                   anchors.horizontalCenterOffset: 85
                   font.pixelSize: 17
               }
               Image {
                   id: image1
                   width: 200
                   height: 200
                   sourceSize.height: 200
                   sourceSize.width: 200
                   anchors.verticalCenterOffset: 103
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.verticalCenter: txt1.verticalCenter
                   source: "img/icon.png"
               }
    }
}

}
