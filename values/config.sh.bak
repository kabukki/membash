#!/bin/bash

#########################################
# This file defines what package is to
# be used in the game. You can create your
# own, or find public ones on www.truc.com
# Variables should never be null
#########################################

# Package to be used
PACKAGE=default

# Default quiz to be used if none is specified
DEFAULT_FILE=geo/europe_FR

# File in which will be stored game scores
SCORE_FILE=scorelog

#########################################
# Do not modify the following unless you
# are confident in what you are doing.
# Modifications could result in partial
# or total malfunctioning of the game.
#########################################

# Paths
ROOT_DIR=$(pwd)

SRC_DIR=$ROOT_DIR/src
LIST_DIR=$ROOT_DIR/list
PACKAGE_DIR=$ROOT_DIR/values/packages

LOADERS_FILE=$SRC_DIR/loaders.sh
HELPER_FILE=$SRC_DIR/helper.sh
MAIN_FILE=$SRC_DIR/main.sh

STRINGS_FILE=$PACKAGE_DIR/$PACKAGE/strings.sh
VARS_FILE=$PACKAGE_DIR/$PACKAGE/vars.sh

# Hard strings
RM_ACCENTS="y/àâçéèêëîïôöùüûÂÀÇÉÈÊËÎÏÔÖÙÜ-/aaceeeeiioouuuAACEEEEIIOOUU /"
DATE_FORMAT="%d/%m/%y %H:%M:%S"
SED_CMD="-r /^#|^$/d"

# Formatting
RED=$(tput setaf 1)
GRN=$(tput setaf 2)
YLW=$(tput setaf 3)
BLU=$(tput setaf 4)
MAG=$(tput setaf 5)
CYN=$(tput setaf 6)
WHI=$(tput setaf 7)
BLD=$(tput bold)
NRM=$(tput sgr0)

# Variables
HINT=
EXPC=
INPUT=none
RAW_INPUT=$INPUT

SCORE=0
COUNT=1
TOTAL=0
RATIO=0
ROW=0
BEST=0

FILE=
