TEMPLATE = app
LANGUAGE = C++

CONFIG += qt warn_on release

QT += network xml

INCLUDEPATH += ..
DEPENDPATH += ..

HEADERS += simplehttp.h \
           osparser.h \
           ../filechooser.h \
           ../languages.h \
           findsubtitleswindow.h

SOURCES += simplehttp.cpp \
           osparser.cpp \
           ../filechooser.cpp \
           ../languages.cpp \
           findsubtitleswindow.cpp \
           main.cpp

FORMS += ../filechooser.ui findsubtitleswindow.ui

DEFINES += NO_SMPLAYER_SUPPORT DOWNLOAD_ZIP

contains( DEFINES, DOWNLOAD_ZIP ) {
	INCLUDEPATH += filedownloader quazip
	DEPENDPATH += filedownloader quazip

	HEADERS += filedownloader.h
	SOURCES += filedownloader.cpp

	HEADERS += crypt.h \
	           ioapi.h \
	           quazip.h \
	           quazipfile.h \
	           quazipfileinfo.h \
	           quazipnewinfo.h \
	           unzip.h \
	           zip.h

	SOURCES += ioapi.c \
	           quazip.cpp \
	           quazipfile.cpp \
	           quazipnewinfo.cpp \
	           unzip.c \
	           zip.c

	LIBS += -lz
}

unix {
  UI_DIR = .ui
  MOC_DIR = .moc
  OBJECTS_DIR = .obj
}

win32 {
  CONFIG += console
}

