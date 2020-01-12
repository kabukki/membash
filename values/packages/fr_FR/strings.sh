#!/bin/bash

#########################################
# This file defines the strings used by
# the game. Strings should never be null
#########################################

#########################################
# Available escape sequences are:
#   \q  question number
#   \T  total number of questions
#   \l  current number of lives
#   \h  hint (mandatory)
#   \r  number of consecutive good answers
#   \b  best good answers streak
#   \s  current score (raw)
#   \S  current score (percentage)
#   \e  expected answer
#   \i  last user input
#   \d  timer delay if enabled
#   \f  file being used as source
#   \L  file where score will be stored
#   \u  user currently logged in
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

WELCOME="Bienvenue! Vous jouez avec: \f.\n\
Bonne chance!"

# Prompt displayed at each iteration.
#PROMPT="(\q/\T - \r+\b) [\l vies] \h <-> "
PROMPT="\7(\q/\T - \r+\b)\N \6[\l vies]\N \B\h\N <-> "

GOOD_ANSW="Bonne réponse! (\e)"
WRNG_ANSW="Mauvaise réponse! Attendu '\e', eu '\i'."
TIMEOUT="Temps écoulé! La réponse était: '\e'"
EXTR_LIFE="3 bonnes réponses à la suite: vie bonus!"

COMMENT_0="Dommage!"
COMMENT_1="Pas mal!"
COMMENT_2="Bien!"
COMMENT_3="Excellent!"
COMMENT_4="Félicitations, vous êtes incollable!!!"

END="Partie terminée. Score: \s/\q. (\S %)"
GOODBYE="Plus longue série: \b bonnes réponses à la suite. Sauvegarde dans '\L'"
EXIT="Appuyez sur une touche pour quitter."

#########################################
# Do not modify the following unless you
# are confident in what you are doing.
# Modifications could result in partial
# or total malfunctioning of the game.
#########################################

WITNESS=2
