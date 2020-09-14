/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import "Settings.js" as Setting

Rectangle {
    color: "black"
    anchors{top: statusBar.bottom; bottom:parent.bottom;right:parent.right;left:parent.left}
    opacity:0
    z:10
    visible: true
    id: countdown
    MouseArea{anchors.fill: parent}
    Behavior on opacity{NumberAnimation{}}
    property string cbuten: "true"
  //  property int hour: 0
    property int min: 0
    property int sec: 0
    property int milisec: 0
    property bool run: false
    property Component __cc: null
    property Component __picker: null
    property string timerText: timetext.text
    property alias playpausebut: pauseplay.enabled
    property alias stopbut: stop.enabled
    function op(){
        if (!__picker) __picker = Qt.createComponent("CountdownPicker.qml")
        __picker.createObject(countdown)
    }
    function openccd(){
        if (!__cc) __cc = Qt.createComponent("CDCompleted.qml")
          __cc.createObject(countdown)
    }
    function updateTimerDisplay() {
      //  var hour_str = hour.toString()
        var min_str = min.toString()
        var sec_str = sec.toString()
        var mil_str = (milisec / 100).toString()
        countdstatus=timetext.text
      //  if(hour_str.length == 1){
          //     hour_str = "0" + hour_str
            //    }
        if (min_str.length == 1) {
            min_str = "0" + min_str
        }
        if (sec_str.length == 1) {
            sec_str = "0" + sec_str
        }
         return min_str + ":" + sec_str + "." + mil_str
    }

    function runCountdown() {
        if (milisec < 0) {
            milisec = 900
            sec -= 1
        }
        if (sec < 0) {
            sec = 59
            min -= 1
        }
        if (min < -0)  {
            audio.play()
            rumble.start();
            window.title= "Countdown Finished"
            console.log ("Timer Finished")
            pauseTimer()
            resetTimer()
            QMLUtils.caKnLong("", "Countdown Completed!")
            if(oneLED===false){QMLUtils.blinkLight()} else{ QMLUtils.blinkLightOneBut();    }
          if(applicationActive) {console.debug("App Not active, no dialog will be shown"); openccd();} else{utils.restartDialog();}
        }
        //if(hour <0){

        //}
        return updateTimerDisplay()
    }

    function resetTimer() {
        milisec = 0
        sec = 0
        min = 0
     //   hour=0
        timetext.text = qsTr("00:00.0")
        countdstatus=""
        cbuten="true"
        timetext.color="white"

    }
    function startTimer() {
        run = true
        timer.start()
        colourfulTimerText===true?  timetext.color= "white":  timetext.color= "lime"

    }
    function pauseTimer() {
        run = false
        timer.stop()
        timetext.color= "white"
    }
    function stopTimer() {
       colourfulTimerText===true?  timetext.color= "white":  timetext.color= "red"
        pauseTimer()
        resetTimer()
    }
    Timer {
        id: timer
        interval: 100; running: false; repeat: true
        onTriggered: {
               milisec -= interval
               timetext.text = runCountdown()
        }
    }
    Bar{id: topbarc; paddingLine: false
        Text{id: stopwatchstatus; text:stopwstatus===""?"Stopwatch: Not Running":"Stopwatch: "+stopwstatus; anchors.verticalCenter: parent.verticalCenter;anchors.horizontalCenter: parent.horizontalCenter; color:"white"; MouseArea{anchors.fill: parent;onClicked:{countdown.opacity=0}}}
    }
    Text {
        id: headerText
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Countdown Mode")
        color: platformStyle.colorNormalLight
        font.pixelSize: platformStyle.fontSizeMedium

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Text {
        id: timetext
        anchors {
            top: headerText.bottom
            left: parent.left
            right: parent.right
        }
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("00:00.0")
        color: platformStyle.colorNormalLight
        font.pixelSize: 110
    }
ButtonRow{
    id: setTimeButton
    anchors {
        bottom: toolBar.top
        left: parent.left
        right: parent.right
        leftMargin: 10
        rightMargin: 10
    }
    ToolButton {
        text: qsTr("Set Time")
        onClicked: {
            op();
        }
    }
}
   BottomBar{
       id: toolBar
            ToolButton {
                iconSource: "toolbar-back"
                onClicked: countdown.opacity=0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
            }
          ToolButton{
              id: pauseplay
              enabled: cbuten==="true"? false:true
              iconSource: run ? "toolbar-mediacontrol-pause" : "toolbar-mediacontrol-play"
              anchors.centerIn: parent
              checked: run? true: false
              checkable: true
              onClicked: {run? pauseTimer(): startTimer()}
          }
          ToolButton{
              id: stop
              enabled: cbuten==="true"? false:true
              iconSource: "toolbar-mediacontrol-stop"
              anchors.right:parent.right
              anchors.verticalCenter: parent.verticalCenter
              onClicked: {
                  if (run) {
                      stopTimer()
              }

              }
        }
    }


}

