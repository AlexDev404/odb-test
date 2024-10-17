QT = core

CONFIG += c++17 cmdline

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    driver.cxx

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    database.hxx \
    employee.hxx

# List of header files that should be compiled with the ODB compiler.
#
ODB_FILES += employee.hxx

# ODB compiler flags.
#
ODB_FLAGS = --database pgsql --profile qt --generate-schema --generate-query --generate-session

# Select the database we are going to use.
#
DEFINES += DATABASE_PGSQL

# Suppress unknown pragmas GCC warnings.
#
QMAKE_CXXFLAGS_WARN_ON = $$QMAKE_CXXFLAGS_WARN_ON -Wno-unknown-pragmas

# Link to the ODB runtime libraries.
#
LIBS += -lodb-pgsql
LIBS += -lodb-qt
LIBS += -lodb

# ODB compilation rules. Normally you don't need to change anything here.
#

# # Add the Qt headers directory to the ODB include directory list.
# #
# ODB_FLAGS += -I$$[QT_INSTALL_HEADERS]

# # Newer versions of QtCreator do builds in a separate directory. As a
# # result, we need to append the source directory to ODB files.
# #
# for(dir, ODB_FILES) {
#   ODB_PWD_FILES += $$PWD/$${dir}
# }

# odb.name = E:\Data\PROGRAMMING\Qt\ODB\odb-2.5.0-b.3-i686-windows\bin\odb ${QMAKE_FILE_IN}
# odb.input = ODB_PWD_FILES
# odb.output = ${QMAKE_FILE_BASE}-odb.cxx
# odb.commands = E:\Data\PROGRAMMING\Qt\ODB\odb-2.5.0-b.3-i686-windows\bin\odb $$ODB_FLAGS ${QMAKE_FILE_IN}
# odb.depends = $$ODB_PWD_FILES
# odb.variable_out = SOURCES
# odb.clean = ${QMAKE_FILE_BASE}-odb.cxx ${QMAKE_FILE_BASE}-odb.hxx ${QMAKE_FILE_BASE}-odb.ixx ${QMAKE_FILE_BASE}.sql
# QMAKE_EXTRA_COMPILERS += E:\Data\PROGRAMMING\Qt\ODB\odb-2.5.0-b.3-i686-windows\bin\odb

# odbh.name = E:\Data\PROGRAMMING\Qt\ODB\odb-2.5.0-b.3-i686-windows\bin\odb ${QMAKE_FILE_IN}
# odbh.input = ODB_PWD_FILES
# odbh.output = ${QMAKE_FILE_BASE}-odb.hxx
# odbh.commands = @true
# odbh.CONFIG = no_link
# odbh.depends = ${QMAKE_FILE_BASE}-odb.cxx
# QMAKE_EXTRA_COMPILERS += odbh
