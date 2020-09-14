#Copyright (C) 2020 Allstar Software (Paul Wallace)
# Add more folders to ship with the application, here
folder_01.source = qml/EasyStopWatch
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =
symbian:TARGET.UID3 = 0xE0324349

#symbian:TARGET.UID3 = 0x2006c2f0

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian {
    TARGET.CAPABILITY += ReadUserData
    my_deployment.pkg_prerules += vendorinfo

    DEPLOYMENT += my_deployment
VERSION = 1.31

    vendorinfo += "%{\"Allstar Software\"}" ":\"Allstar Software\""
    LIBS += -L\epoc32\release\armv5\lib -lremconcoreapi\
    LIBS += -L\epoc32\release\armv5\lib -lremconinterfacebase\
LIBS += -letel3rdparty \
            -lapgrfx \
              -lfeatdiscovery \
              -lws32 \
             -lsysutil \
              -lefsrv \
               -lavkon\
               -lhal \
               -lapparc\
           -lCommonDialogs\
          -lPlatformEnv\
      -leikcore\
-lapgrfx\ -lcone \-lws32\-lbitgdi \-lfbscli \-laknskins \-laknskinsrv \-leikcore\-lhswidgetpublisher\ -laknnotify\ -lhwrmlightclient \-leiksrv
}

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
 CONFIG += mobility
 MOBILITY += systeminfo
CONFIG += multimediakit


# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable
# Add dependency to Symbian components
CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    qmlutils.cpp \
    utils.cpp \
    mediakeysobserver.cpp
 #  hswidget.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

RESOURCES += \
    res.qrc

HEADERS += \
    qmlutils.h \
    qhswidget.h \
    utils.h \
    mediakeysobserver.h
 #  hswidget.h
addFiles.pkg_postrules += "\"HSWidgetPlugin0x2006c2f0.dll\" - \"!:\\sys\\bin\\HSWidgetPlugin0x2006c2f0.dll\""
addFiles.pkg_postrules += "\"1.aac\" - \"e:\Resource\EasyStopWatch\1.aac\""
addFiles.pkg_postrules += "\"2.aac\" - \"e:\Resource\EasyStopWatch\2.aac\""
addFiles.pkg_postrules += "\"3.aac\" - \"e:\Resource\EasyStopWatch\3.aac\""
addFiles.pkg_postrules += "\"4.aac\" - \"e:\Resource\EasyStopWatch\4.aac\""
addFiles.pkg_postrules += "\"beep.wav\" - \"e:\Resource\EasyStopWatch\beep.wav\""
addFiles.pkg_postrules += "\"completedsound.mp3\" - \"e:\Resource\EasyStopWatch\completedsound.mp3\""
DEPLOYMENT += addFiles

gccOption = "OPTION gcce -fpermissive"
MMP_RULES += gccOption


