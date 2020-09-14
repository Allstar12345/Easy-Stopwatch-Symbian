/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import "Settings.js" as Setting


Rectangle {
    color: "black"
    QtObject { id: create; property Component com: null;function createComponent (qmlfile){com = Qt.createComponent(qmlfile);com.createObject(mainPage)} }
   anchors{top: statusBar.bottom; bottom:parent.bottom;right:parent.right;left:parent.left}
    id: mainPage
       property string lme: ""
    function openAbout(){create.createComponent(Qt.resolvedUrl("About.qml")); }
       function openlpo(){create.createComponent(Qt.resolvedUrl("LongPressOptions.qml")); }
       function openmenu(){create.createComponent(Qt.resolvedUrl("DropDownMenu.qml"));}
    function opensettings(){create.createComponent(Qt.resolvedUrl("Settings.qml"));}
    function largeMode(){toolBar.hide();large.show();lapListView.anchors.bottom=large.top; lme="true"}
    function hidelargeMode(){large.hide();lapListView.anchors.bottom=toolBar.top; toolBar.show();lme=""}

Timer{
    id: distimer
    interval: 580; running: false; repeat: false
    onTriggered:{
        bigstartpause.visible= false
    }
}


Timer{
    id:intervalbeep
    interval: 30000
    running: false
    repeat: true
    onTriggered:{
        beep.play();
       // console.log ("BEEPED !")
    }
}
  //  property int hour: 0
    property int min: 0
    property int sec: 0
    property int milisec: 0
    property bool run: false
    function updateTimerDisplay() {
//      var hour_str = hour.toString()
        var min_str = min.toString()
        var sec_str = sec.toString()
        var mil_str = (milisec / 100).toString()
        stopwstatus=timeText.text
   // if(hour_str.length == 1){
    //   hour_str = "0" + hour_str
     //   }
        if (min_str.length == 1) {
            min_str = "0" + min_str
        }
        if (sec_str.length == 1) {
            sec_str = "0" + sec_str
        }
      //return hour_str+":" +min_str + ":" + sec_str + "." + mil_str
        return min_str + ":" + sec_str + "." + mil_str
    }
    function runStopwatch() {
        if (milisec >= 1000) {
            milisec = 0
            sec += 1
        }
        if (sec >= 60) {
            sec = 0
            min += 1
        }
        if (min >= 60) {
            min = 0
            //hour +=1
        }
       // if(hour>=60){
        //    hour = 0
       // }
        return updateTimerDisplay()
    }
    function resetTimer() {
        milisec = 0
        sec = 0
        min = 0
        timeText.text = qsTr("00:00.0")
        timeText.color="white"
        toolbarstop.iconSource="toolbar-mediacontrol-stop"
        QMLUtils.caKnLong("","Stopwatch Reset")
        stopwstatus=""
    }
    function startTimer() {
        intervalbeep.start();
        run = true
        colourfulTimerText===true?  timeText.color= "white":  timeText.color= "lime"
        timer.start()
        toolbarlap.enabled = true
        toolbarstop.iconSource="toolbar-mediacontrol-stop"
        timeText.opacity=1.0;
}
    function pauseTimer() {
        intervalbeep.stop()
        run = false
        timeText.color= "white"
        timer.stop()
        toolbarlap.enabled =  false
        QMLUtils.caKnLong("","Stopwatch Paused")
        toolbarstop.iconSource="img/clear.svg"
        timeText.opacity=0.600;
    }

    function stopTimer() {
        intervalbeep.stop()
        pauseTimer()
        colourfulTimerText===true?  timeText.color= "white":  timeText.color= "red"
        toolbarplay.checked=false
        toolbarstop.iconSource="img/clear.svg"
        QMLUtils.caKnLong("","Stopwatch Stopped")
        timeText.opacity=0.600;
    }

    Timer {
        id: timer
        interval: 100; running: false; repeat: true
        onTriggered: {
                milisec += interval
                timeText.text = runStopwatch()
        }
    }
    Bar{id: topbar; paddingLine: false
        ToolButton{height: 40; width: 40;anchors.verticalCenter: parent.verticalCenter;anchors.right:parent.right; iconSource: "toolbar-menu";onClicked: {openmenu();}}
        Text{id: countdownstatus; text:countdstatus===""?"Countdown Timer: Not Running":"Countdown Timer: "+countdstatus; anchors.verticalCenter: parent.verticalCenter;anchors.left: parent.left; color:"white"; MouseArea{anchors.fill: parent;onClicked:{countdown.opacity=1}}}
    }
    Text {
        id: timeText
        opacity: 0.600
        Behavior on opacity{NumberAnimation{}}
        anchors {
            top: topbar.bottom
            left: parent.left
            right: parent.right
        }
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("00:00.0")
        anchors.leftMargin: 5
        color: platformStyle.colorNormalLight
        font.pixelSize:screen.width===360? 110: 90
    }

    ListView {
        id: lapListView
        highlightFollowsCurrentItem: true
        anchors {
            top: timeText.bottom
            left: parent.left
            right: parent.right
            bottom: toolBar.top
        }
        clip: true

        model: ListModel {
            id: lapListModel
        }
      ScrollDecoratorCustom{
            flickableItem: lapListView
        }
        delegate: ListItem {
            ListItemText {
                text: lapTimeText
                role: "Title"
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
                anchors {
                    left: parent.left
                    leftMargin: 10
                    right: parent.right
                    rightMargin: 10
                }
            }
        }
    }

LargeButtons{id:large}
    BottomBar{
        id: toolBar

          ToolButton{
              id: toolbarplay
              checkable: true
              anchors.right: parent.right
              anchors.verticalCenter: parent.verticalCenter
              iconSource: run ? "toolbar-mediacontrol-pause" : "toolbar-mediacontrol-play"
              checked: run? true: false
              onClicked: {
                  if (run) {
                      pauseTimer()
                      intervalbeep.stop()
                      lapListModel.append({"lapTimeText": "Paused "+timeText.text})

                  } else {
                      startTimer()
                      intervalbeep.start()
                  }
              }
          }
          ToolButton{
              id: toolbarstop
              anchors.left: parent.left
              anchors.verticalCenter: parent.verticalCenter
              enabled: sec===0? false:true
              iconSource: "toolbar-mediacontrol-stop"
              onClicked: {
                  if (run) {
                      stopTimer()
                      lapListModel.append({"lapTimeText": "Stopped "+timeText.text })
                  }
                  else{
                      resetTimer()
                      lapListModel.clear()
                  }
              }
              }

          ToolButton{
              text: "Split"
              enabled: false
              id: toolbarlap
              anchors.centerIn: parent
              onClicked: {
                  var count = lapListModel.count
                  lapListModel.append({"lapTimeText": timeText.text})
                  lapListView.currentIndex = count
              }
          }
        }
    }
