/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1
import QtMobility.systeminfo 1.1
import QtMultimediaKit 1.1
import QtMobility.feedback 1.1
import avkonUtils 1.0
//import MediaKeysObserver 1.0
import "Settings.js" as Setting


Window{
    id: window
        QtObject { id: create; property Component com: null;function createComponent (qmlfile){com = Qt.createComponent(qmlfile);com.createObject(window)} }
     property string e6: screen.height===480
     property string sound : Setting.get("sound") != '' ? Setting.get("sound") : ""
     property string title : ""
     property bool set_scroll : Setting.get("scroll") != '' ? Setting.get("scroll") : true;
     property string countdstatus: ""
     property string stopwstatus: ""
     property bool applicationActive:Qt.application.active
     property string countdownMin: ""
     property string countdownSec: ""
    property string countdownHour: ""
     property bool oneLED: false
     property bool colourfulTimerText: false

    onApplicationActiveChanged: {if(applicationActive){screenSaver.setScreenSaverDelayed(true); console.debug("App Active")}else{screenSaver.setScreenSaverDelayed(false); console.debug("App Inactive")}
    }

    HapticsEffect{id: rumble; intensity: 1.0; duration: if(Setting.get("vibra")===""){2000}else{0} attackTime: 2000; attackIntensity: 1.0; period: 0}
    StatusBar{
        id: statusBar
        z: 10
        anchors.top: parent.top
      //  VolumeRocker{id:rocker}
        Text {
            id: statusBarTitle
            text: title
            color:"white"
            font.pointSize: e6? 7: 6
            visible: true
            elide: Text.ElideRight
            wrapMode: Text.WrapAnywhere
            maximumLineCount: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
        }
    }


    /*MediaKeysObserver {
        id: mediakeysobserver
        property int key

        onMediaKeyClicked: {
            rocker.show();

            if (key == MediaKeysObserver.EVolIncKey) {
                if (audio.volume < 1.0) {

                }
            }

            else if (key == MediaKeysObserver.EVolDecKey) {
                if (audio.volume> 0.05) {

                }
            }
         }

        onMediaKeyPressed: {
            rocker.show();
            mediakeysobserver.key = key
        }
        onMediaKeyRelease: {
            rocker.hide()
        }
    }*/
MainPage {}

DeviceInfo{id: mobinfo}
function restartCountdown(){}
AvkonUtils{id: utils; onMuteCountdown:{QMLUtils.caKnLong("", "Countdown Muted"); audio.stop();} onRestartCountdown:{countdown.playpausebut=true; countdown.stopbut=true;audio.stop();countdown.pauseTimer();countdown.resetTimer();countdown.min=countdownMin; countdown.sec=countdownSec; countdown.hour=countdownHour; countdown.timerText = countdown.updateTimerDisplay(); countdown.startTimer(); QMLUtils.caKnLong("", "Countdown Restarted")}}
    ScreenSaver { id: screenSaver
           Component.onCompleted: {screenSaver.setScreenSaverDelayed(true) }
       }


    function exit(){
        if(Setting.get("exitdio")===""){
            create.createComponent(Qt.resolvedUrl("CloseDialog.qml"));}
        else{Qt.quit();}

    }

    Audio{
        volume:if ( Setting.get("intervalbep")=== true){
                   beep.volume= 0.70
               }
               else{
                   beep.volume= 0.00
               }

        id: beep
        source: "file:///e:/Resource/EasyStopWatch/beep.wav"
    }
    Audio{
         id: audio
         volume: if(Setting.get("volume")===""){0.70} else{Setting.get("volume")}
         source: sound===""?"file:///e:/Resource/EasyStopWatch/completedsound.mp3": sound
     }

    Countdown{
        id: countdown
    }


    Component.onCompleted: {
        window.title= "Easy StopWatch";
        if(mobinfo.model==="N8-00"){oneLED=true}
        if(mobinfo.model==="E7-00"){oneLED=true}
        if(mobinfo.model==="X7-00"){oneLED=true}
        if(mobinfo.model==="C6-01"){oneLED=true}
       Setting.get("colourfulText")===""? colourfulTimerText=false: colourfulTimerText=true
       console.log(colourfulTimerText)
    }
}
