#!/bin/bash

#########################################
# This file defines the strings used by
# the game. Strings should never be null
#########################################

#########################################
# Available escape sequences are:
#   \q	question number
#   \T	total number of questions
#   \l	current number of lives
#   \j	current number of jokers
#   \h	hint (mandatory)
#   \r	number of consecutive good answers
#   \b	best good answers streak
#   \s	current score (raw)
#   \S	current score (percentage)
#   \e	expected answer
#   \i	last user input
#   \d	timer delay if enabled
#   \f	file being used as source
#   \L	file where score will be stored
#   \u	user currently logged in
#   \V	game version
#   \W	package version
######### Formatting sequences #########
#   \N  reset formatting
#   \B  bold
#   \1  red
#   \2  green
#   \3  yellow
#   \4  blue
#   \5  magenta
#   \6  cyan
#   \7  white
# Do not forget to include a '\h' hint
# or the player won't be able to answer!
########################################

WARN_VER="\3Warning: Your package is outdated. Some features may not work as expected. Please consider upgrading to the latest version (\W < \V).\N"

WELCOME="Welcome! You are playing: \f.\n\
Good luck!"

# Prompt displayed at each iteration.
PROMPT="\7(\q/\T - \r+\b)\N \5[\j jokers]\N \6[\l lives]\N \B\h\N <-> "

GOOD_ANSW="Good answer! (\e)"
WRNG_ANSW="Wrong answer! Expected '\e', got '\i'."
TIMEOUT="Time out! The answer was: '\e'"
EXTR_LIFE="3 good answers in a row: bonus life!"
EXTR_JOKER="5 good answers in a row: extra joker!"
JOKERS_Z="Sorry, no joker available!"
HINT_CHAR="*"

COMMENT_0="Too bad!"
COMMENT_1="Not bad!"
COMMENT_2="Good!"
COMMENT_3="Excellent!"
COMMENT_4="Congratulations, you are unbeatable!!!"

END="Game ended. Score: \s/\q. (\S %)"
GOODBYE="Longest streak: \b good answers in a row. Saving to '\L'"
EXIT="Press any key to exit."

#########################################
# Do not modify the following unless you
# are confident in what you are doing.
# Modifications could result in partial
# or total malfunctioning of the game.
#########################################

WITNESS=2
