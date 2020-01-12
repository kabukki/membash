#!/bin/bash

readInput() {
    decode "$PROMPT" n
    read -r RAW_INPUT
}
removeDiacritic() {
    # Remove accents
    i=0
    while [[ $i -lt ${#ANSW[@]} ]]; do
	ANSW[$i]=$(echo ${ANSW[$i]} | sed "$RM_ACCENTS")
	(( ++i ))
    done
    INPUT=$(echo $RAW_INPUT | sed "$RM_ACCENTS")
}
array_contains() {
    # Loop over array. if input matches any of the possible answers, return OK
    local target=$1; shift
    for elem; do
	[[ "${elem,,}" == "${target,,}" ]] && return 0
    done
    return 1
}
decode() {
    local NS="$1"
    NS=${NS//\\q/$COUNT}
    NS=${NS//\\T/$TOTAL}
    NS=${NS//\\l/$LIVES}
    NS=${NS//\\j/$JOKERS}
    NS=${NS//\\h/$HINT}
    NS=${NS//\\r/$ROW}
    NS=${NS//\\s/$SCORE}
    NS=${NS//\\S/$RATIO}
    NS=${NS//\\b/$BEST}
    NS=${NS//\\e/$EXPC}
    NS=${NS//\\i/$RAW_INPUT}
    NS=${NS//\\d/$TIMER}
    NS=${NS//\\f/$FILE}
    NS=${NS//\\L/$SCORE_FILE}
    NS=${NS//\\u/$USER}
    NS=${NS//\\V/$VERSION}
    NS=${NS//\\W/$PKG_VERSION}
    # Formatting
    NS=${NS//\\N/$NRM}
    NS=${NS//\\B/$BLD}
    NS=${NS//\\1/$RED}
    NS=${NS//\\2/$GRN}
    NS=${NS//\\3/$YLW}
    NS=${NS//\\4/$BLU}
    NS=${NS//\\5/$MAG}
    NS=${NS//\\6/$CYN}
    NS=${NS//\\7/$WHI}
    [[ $# -eq 2 && $2 = "n" ]] && echo -en "$NS" || echo -e "$NS"
}
comment() {
    if [ $1 -lt 25 ]; then echo $COMMENT_0
    elif [ $1 -lt 50 ]; then echo $COMMENT_1
    elif [ $1 -lt 75 ]; then echo $COMMENT_2
    elif [ $1 -lt 100 ]; then echo $COMMENT_3
    else echo $COMMENT_4; fi
}
checkVersion() {
    [[ "$PKG_VERSION" != "$VERSION" ]] && decode "$WARN_VER"
}
formattedDate() {
    date "+$DATE_FORMAT"
}
greet() {
    echo "--------------------"
    decode "$YLW$WELCOME$NRM"
    echo "--------------------"
}
goodbye() {
    [[ $COUNT -gt 0 ]] && RATIO=$(( 100*SCORE/COUNT )) || RATIO=0
    echo "--------------------"
    decode "$YLW$END$NRM"
    comment $RATIO
    decode "$GOODBYE"
    echo "--------------------"
}
