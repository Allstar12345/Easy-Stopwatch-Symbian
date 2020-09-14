// Copyright (C) 2020 Allstar Software (Paul Wallace)

#include "utils.h"
#include <AknCommonDialogs.h>
#include <AknCommonDialogsDynMem.h>
#include <AknGlobalNote.h>
#include <avkon.mbg>


Utils::Utils(QObject *parent) :
    QObject(parent)
{

}



void Utils::restartDialog()const{

        _LIT(KTxtLine1,"Your Countdown has finished,");
        _LIT(KTxtLine2,"Would you like to restart or Mute?");
        _LIT(KButt1,"Restart");
        _LIT(KButt2,"Mute");

        TInt whichbutton(-1);
        TRequestStatus stat;
        RNotifier notifier;
        User::LeaveIfError(notifier.Connect());
        notifier.Notify(KTxtLine1,KTxtLine2,KButt1,KButt2,whichbutton,stat);
        User::WaitForRequest(stat);
        if (whichbutton==0)
        {
            emit restartCountdown();
        }
       if (whichbutton==1){emit muteCountdown();}
        notifier.Close();


}
