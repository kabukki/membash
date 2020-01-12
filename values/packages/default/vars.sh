#!/bin/bash

#########################################
# This file defines some of the variables
# used by the game. Variables should
# never be null
#########################################

# Number of lives the player starts
# the game with
LIVES=3

# Number of jokers to start with
JOKERS=5000

# Limited time to give an answer. If set
# to zero, disables the timer.
# Note: no longer used since 0.6
TIMER=0

# Package version should match game version
PKG_VERSION=0.6

#########################################
# Do not modify the following unless you
# are confident in what you are doing.
# Modifications could result in partial
# or total malfunctioning of the game.
#########################################

# Username that will be used
USER=${USER:-unknown}

WITNESS=1
