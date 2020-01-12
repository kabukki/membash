#!/bin/bash

H_BUF=
H_NL=1

# Main functions
goodAnswer() {
    decode "$GRN$1$NRM"
    (( ++SCORE ))
    (( ++ROW ))
    if [ $ROW -gt 0 ] && [ $(( ROW%3 )) -eq 0 ]; then
	decode "$EXTR_LIFE"
	(( ++LIVES ))
    fi
    if [ $ROW -gt 0 ] && [ $(( ROW%5 )) -eq 0 ]; then
	decode "$EXTR_JOKER"
	(( ++JOKERS ))
    fi
}
wrongAnswer() {
    decode "$RED$1$NRM"
    (( LIVES-- ))
    ROW=0
}
dispHint() {
    if [ -z "$H_BUF" ]; then
	H_BUF="$EXPC"
	H_NL=1
    else (( ++H_NL ))
    fi

    echo -n ${H_BUF:0:$H_NL}
    local len=${#H_BUF}
    # If all letters are already revealed, prevent joker from being wasted
    if [ $len -lt $H_NL ]; then
	(( H_NL-- ))
	echo; return
    fi
    while [ $H_NL -lt $len ]; do
	echo -n "$HINT_CHAR"
	(( len-- ))
    done; echo
    (( JOKERS-- ))
}
main() {
    # Setting IFS for multiple answers
    IFS="|"
    while [[ $COUNT -le $TOTAL && $LIVES -gt 0 ]]; do
	IDX=$(( RANDOM%( TOTAL-COUNT+1 ) ))
	TYPE=$(( RANDOM%2 ))
	case $TYPE in
	    0) HINT=(${LEFT[$IDX]})
	       ANSW=(${RIGHT[$IDX]}) ;;
	    1) HINT=(${RIGHT[$IDX]})
	       ANSW=(${LEFT[$IDX]}) ;;
	esac

	HINT=${HINT[0]}
	EXPC=${ANSW[0]}
	RATIO=$(( 100*SCORE/(COUNT-$(( COUNT==1?0:1 ))) ))

	while readInput || echo; do
	    removeDiacritic
	    if [[ "${INPUT,,}" == "joker" ]]; then
		[[ $JOKERS -gt 0 ]] && dispHint || decode "$JOKERS_Z"
		continue
	    else
		if array_contains "$INPUT" "${ANSW[@]}"; then
		    goodAnswer "$GOOD_ANSW"
		else wrongAnswer "$WRNG_ANSW"
		fi
		unset H_BUF; break
	    fi
	done

	[[ $ROW -gt $BEST ]] && BEST=$ROW
	unset LEFT[$IDX] ; LEFT=( "${LEFT[@]}" )
	unset RIGHT[$IDX] ; RIGHT=( "${RIGHT[@]}" )
	(( ++COUNT ))
    done
    unset IFS
    (( COUNT-- ))
}
