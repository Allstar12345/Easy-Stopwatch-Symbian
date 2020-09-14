/**
Copyright (C) 2020 Allstar Software (Paul Wallace)
*/
import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
TimerPicker {
    Component.onCompleted: {
        open()}
        onStatusChanged: {
            if (status === DialogStatus.Closing) __isClosing = true
            else if (status === DialogStatus.Closed && __isClosing) timePickerDialog.destroy()
        }
        property bool __isClosing: false
    privateCloseIcon: true
     id: timePickerDialog
     fields:  DateTime.Minutes | DateTime.Seconds
     titleText: "Countdown Time"
     acceptButtonText: "OK"
     onAccepted: {
     //    hour = timePickerDialog.hour
         min = timePickerDialog.minute
         sec = timePickerDialog.second
         timetext.text = updateTimerDisplay()
         cbuten=""
         countdownMin= min
         countdownSec= sec
         //countdownHour=hour

     }
 }
