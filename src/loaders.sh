#!/bin/bash

loadVars() {
    [[ -f "$VARS_FILE" ]] && . "$VARS_FILE" || end "No vars file found, aborting"
    [[ -z "$WITNESS" || $WITNESS -ne 1 ]] && end "Encountered a problem, bailing out (vars)"
}
loadStrings() {
    [[ -f "$STRINGS_FILE" ]] && . "$STRINGS_FILE" || end "No strings file found, aborting"
    [[ -z "$WITNESS" || $WITNESS -ne 2 ]] && end "Encountered a problem, bailing out (strings)"
    PROMPT=${PROMPT:-"(\q\t \r+) [\l lives] \h <-> "}
}
execPrepro() {
    while read line; do
	if [[ $line =~ ^@.* ]]; then
	    case $line in
		@include\ *)
		    FTI="$(echo $line | sed 's/^@include //' | tr -d \" | tr -d \')"
		    if [ -f "$LIST_DIR/$FTI" ]; then execPrepro "$LIST_DIR/$FTI"
		    else echo "! Warning: include directive failed for file '$FTI': no such file" >&2
		    fi ;;
		*)
		    echo "! Warning: ignore invalid directive '$line'" >&2 ;;
	    esac
	else
	    echo $line
	fi
    done < "$1"
}
loadFile() {

    [[ $# -eq 1 ]] && FILE="$LIST_DIR/$1" || FILE="$LIST_DIR/$DEFAULT_FILE"
    [[ ! -f "$FILE" ]] && end "No such file (${FILE:-undefined})"

    TOTAL=0
    echo "Loading file content..."
    while IFS='=' read left right; do
	[[ $left =~ ^\#+|^$ ]] && continue
	LEFT[$TOTAL]="$left";
	RIGHT[$TOTAL]="$right";
	(( ++TOTAL ))
    done < <(execPrepro "$FILE")

    echo "$TOTAL entries in file."

    # Reset file name for future uses
    FILE=$(basename "$FILE")
}
