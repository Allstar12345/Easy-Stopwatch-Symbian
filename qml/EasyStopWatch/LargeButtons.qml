/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1
Item{
    z: 5
    anchors{right:parent.right;left:parent.left;bottom:parent.bottom}
    height: screen.width===360? 150: 110
    visible: true
    function show (){console.debug("Showing started");startapp.start();lapapp.start();stopapp.start()}
    function hide(){stopdis.start(); startdis.start(); lapdis.start();}
    SmoothedAnimation{
     id: stopapp
     target: stop
     property: "anchors.leftMargin"
     to :0
 }
 SmoothedAnimation{
     id: startapp
     target: bigstartpause
     property: "anchors.rightMargin"
     to :0
 }
 SmoothedAnimation{
     id: stopdis
     target: stop
     property: "anchors.leftMargin"
     to : -140
 }
 SmoothedAnimation{
     id: startdis
     target: bigstartpause
     property: "anchors.rightMargin"
     to : -140
 }
 SmoothedAnimation{
     id: lapapp
     target: largelap
     property: "anchors.bottomMargin"
     to: 0
 }
 SmoothedAnimation{
     id: lapdis
     target: largelap
     property: "anchors.bottomMargin"
     to : -300
 }

Buttoner {
    id: largelap
    text: "Split"
    enabled: run? true: false
    anchors.bottom: parent.bottom
    anchors.bottomMargin: -300
    anchors.left: stop.right
    height: screen.width===360? 150: 110
    anchors.right: bigstartpause.left
    anchors.rightMargin: 3
    anchors.leftMargin: 3
    visible: true
    onClicked: {
        var count = lapListModel.count
        lapListModel.append({"lapTimeText": timeText.text})
        lapListView.currentIndex = count
    }
}
Buttoner {
    id: stop
    width: 138
    height: screen.width===360? 150: 110
    text:run?  "Stop" : "Clear"
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.leftMargin: -140
    visible: true
    onClicked: {
        if (run) {
            stopTimer()
            intervalbeep.stop()
            lapListModel.append({"lapTimeText": "Stopped " +timeText.text})
        }
        else{
            resetTimer()
            lapListModel.clear()
        }
    }
}
Buttoner {
    id: bigstartpause
    width: 138
    height: screen.width===360? 150: 110
    text: run? "Pause" : "Start"
    anchors.right: parent.right
    anchors.rightMargin: -140
    anchors.bottom: parent.bottom
    visible: true
    onClicked: {
        if (run) {
            pauseTimer()
            intervalbeep.stop()
            lapListModel.append({"lapTimeText": "Paused "+timeText.text})

        } else {
            startTimer()
            intervalbeep.start();
        }
    }
}
}
