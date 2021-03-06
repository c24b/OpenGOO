QT       += core gui xml opengl
CONFIG += c++11

DESTDIR = ../../
TEMPLATE = app

CONFIG(debug, debug|release) {
    TARGET      = OpenGOO
    OBJECTS_DIR = build/debug
    MOC_DIR = build/debug
} else{
    TARGET      = OpenGOO
    OBJECTS_DIR = build/release
    MOC_DIR = build/release
}


#ATTENCTION
#Lib Box2D must be in system folder and also the header files of it!
INCLUDEPATH += ../extlibs/box2d
INCLUDEPATH += ../extlibs/AES/src
INCLUDEPATH += ../opengoo/src
INCLUDEPATH += ../libs/logger/src
INCLUDEPATH += src/GameEngine
INCLUDEPATH += src/GameConfiguration
INCLUDEPATH += src/include

CONFIG(debug, debug|release) {
    LIBS += -L../libs/lib -lloggerd
} else {
    LIBS += -L../libs/lib -llogger
}

LIBS += -L../extlibs/libs

LIBS += -lAES

!win32 {
    LIBS += -lBox2D
    freebsd-g++|freebsd-clang {
        LIBS += -lexecinfo
    }
}

win32: {
    DEFINES += _UNICODE DONT_GRAB_MOUSE
    LIBS += -lDbgHelp -lAdvapi32 -lpsapi -lUser32

    INCLUDEPATH += .
    CONFIG += console

    CONFIG(debug, debug|release) {
        LIBS += -lBox2Dd
    } else {
        LIBS += -lBox2D
    }

    msvc: {
        #  Backtrace on win32
        HEADERS += src/backtracer_win32.h
        SOURCES += src/backtracer_win32.cpp
        release: {
            QMAKE_CXXFLAGS += /Z7 /DEBUG  /Oy-
            QMAKE_LFLAGS   += /DEBUG
        }
    }
}

HEADERS += \
    src/opengoo.h \
    src/flags.h \
    src/physics.h \
    src/circle.h \
    src/fpscounter.h \
    src/og_world.h \
    src/og_camera.h \
    src/og_button.h \
    src/og_sprite.h \
    src/og_windowcamera.h \        
    src/og_strand.h \
    src/og_ball.h \
    src/og_circle.h \
    src/og_ibody.h \
    src/og_rectangle.h \
    src/og_line.h \
    src/og_userdata.h \
    src/og_uibutton.h \
    src/og_data.h \
    src/og_poi.h \
    src/og_fpscounter.h \
    src/og_utils.h \
    src/og_ipipe.h \
    src/og_pipe.h \
    src/og_behavior.h \
    src/og_walk.h \
    src/og_climb.h \
    src/og_fly.h \
    src/og_types.h \
    src/exitsensor.h \
    src/exit.h \
    src/progresswindow.h \
    src/og_layer.h \
    src/island.h \
    src/retrymenu.h \
    src/gamemenu.h \
    src/level.h \
    src/uidata.h \
    src/continuebutton.h \
    src/og_forcefield.h \
    src/ogapplication.h \
    src/ballsensor.h \
    src/spritefactory.h

SOURCES += \
    src/main.cpp \
    src/flags.cpp \
    src/opengoo.cpp \
    src/physics.cpp \
    src/og_world.cpp \
    src/visualdebug.cpp \
    src/og_windowcamera.cpp \
    src/og_strand.cpp \
    src/og_ball.cpp \
    src/og_circle.cpp \
    src/og_ibody.cpp \
    src/og_rectangle.cpp \
    src/og_line.cpp \
    src/og_uibutton.cpp \
    src/og_data.cpp \
    src/og_camera.cpp \
    src/fpscounter.cpp \
    src/og_fpscounter.cpp \
    src/og_utils.cpp \
    src/og_pipe.cpp \   
    src/og_behavior.cpp \
    src/og_walk.cpp \
    src/og_climb.cpp \
    src/og_fly.cpp \
    src/exitsensor.cpp \
    src/exit.cpp \
    src/progresswindow.cpp \
    src/og_layer.cpp \
    src/island.cpp \
    src/retrymenu.cpp \
    src/gamemenu.cpp \
    src/level.cpp \
    src/continuebutton.cpp \
    src/og_forcefield.cpp \
    src/og_radialforcefield.cpp \
    src/ogapplication.cpp \
    src/ballsensor.cpp \
    src/og_sprite.cpp \
    src/spritefactory.cpp


include(src/GameEngine/GameEngine.files)
include(src/PhysicsEngine/PhysicsEngine.files)
include(src/OGLib/OGLib.files)
include(src/GameConfiguration/GameConfiguration.files)


!win32 {
    HEADERS += src/backtracer.h
    SOURCES += src/backtracer.cpp
}

RESOURCES += \
    resources.qrc

OTHER_FILES += \
    README \
    ../README \
    ../README.md \
