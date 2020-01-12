#!/bin/bash

#########################################
# This file defines some of the variables
# used by the game. Variables should
# never be null
#########################################

# Number of lives with which the players
# starts the game
LIVES=3

# Limited time to give an answer. If set
# to zero, disables the timer.
TIMER=0

# Package version should match game version
PKG_VERSION=0.2

#########################################
# Do not modify the following unless you
# are confident in what you are doing.
# Modifications could result in partial
# or total malfunctioning of the game.
#########################################

# Username that will be used
USER=${USER:-$(whoami >/dev/null)}

WITNESS=1
