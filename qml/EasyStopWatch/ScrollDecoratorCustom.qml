/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import "." 1.1
import com.nokia.symbian 1.1
import "Settings.js" as Setting

Item {
    id: root

    //Common Public API
    property Flickable flickableItem: null


    // Symbian specific API
    property bool platformInverted: false

    Item {
        id: decorators
        property bool completed: false

        Loader {
            sourceComponent: decorators.completed ? vertical : undefined
        }
        Loader {
            sourceComponent: decorators.completed ? horizontal : undefined
        }
        Component {
            id: horizontal
            ScrollBar {
                parent: flickableItem
                flickableItem: root.flickableItem
                orientation: Qt.Horizontal
                interactive: set_scroll
                platformInverted: root.platformInverted
                anchors {
                    left: flickableItem.left
                    bottom: flickableItem.bottom
                    rightMargin: height
                }
            }
        }
        Component {
            id: vertical
            ScrollBar {
                parent: flickableItem
                flickableItem: root.flickableItem
                orientation: Qt.Vertical
                interactive: set_scroll
                platformInverted: root.platformInverted
                anchors { top: flickableItem.top; right: flickableItem.right }
            }
        }
        Component.onDestruction: {
            decorators.completed = false
        }
    }
    onFlickableItemChanged: {
        decorators.completed = flickableItem ? true : false
    }
}
