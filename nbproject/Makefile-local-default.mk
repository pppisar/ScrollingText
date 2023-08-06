SHELL=cmd.exe
PATH_TO_IDE_BIN=C:/Program Files/Microchip/MPLABX/v6.00/mplab_platform/platform/../mplab_ide/modules/../../bin/
# Adding MPLAB X bin directory to path.
PATH:=C:/Program Files/Microchip/MPLABX/v6.00/mplab_platform/platform/../mplab_ide/modules/../../bin/:$(PATH)
# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH="C:\Program Files\Microchip\MPLABX\v6.00\sys\java\zulu8.54.0.21-ca-fx-jre8.0.292-win_x64/bin/"
OS_CURRENT="$(shell uname -s)"
MP_AS="C:\mplabx-tools\avrassembler\avrasm2.exe"
DEP_GEN=${MP_JAVA_PATH}java -jar "C:/Program Files/Microchip/MPLABX/v6.00/mplab_platform/platform/../mplab_ide/modules/../../bin/extractobjectdependencies.jar"
MP_AS_DIR="C:\mplabx-tools\avrassembler"
DFP_DIR=C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/ATmega_DFP/2.4.131
