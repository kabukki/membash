#!/bin/bash

CONFIG_FILE=values/config.sh

# Loading function
end() {
    echo $1 ; exit 1
}
loadConfig() {
    [[ -f "$CONFIG_FILE" ]] && . "$CONFIG_FILE" || end "Missing mandatory config file, aborting"
}
help() {
    echo "Synopsis"
    echo "	game-config.sh [-p package] [-d default_file] [-s score_file]"
    echo "Description"
    echo "	-p	name of the package to be used. ex: 'pack' for values/pack."
    echo "	-d	default file holding the quiz entries."
    echo "	-s	file in which will be stored scores."
    echo "	--info	display current configuration."
    echo "	--help	display this help."
    exit
}
info() {
    echo "Current configuration:"
    awk '/^PACKAGE=|^DEFAULT_FILE=|^SCORE_FILE=/ {print $1}' < values/config.sh
    exit
}

### Body
# Fetch package, default file, and score file
loadConfig
# Parse arguments to modify variables
ARGS=($*)
i=0
[[ $# -eq 0 ]] && help
while [ $i -lt $# ]; do
    j=$(( i+1 ))
    case ${ARGS[$i]} in
	"--help")	help ;;
	"--info")	info ;;
    esac
    [[ $j -ge $# ]] && break
    case ${ARGS[$i]} in
	"-p")	PACKAGE=${ARGS[$j]} ;;
	"-d")	DEFAULT_FILE=${ARGS[$j]} ;;
	"-s")	SCORE_FILE=${ARGS[$j]} ;;
    esac
    (( i++ ))
done
# Modify variables remotely
echo "The following changes will apply:"
echo "Package:	$PACKAGE"
echo "Default quiz:	$DEFAULT_FILE"
echo "Score file:	$SCORE_FILE"
read -p "Continue? (y/n) " choice
if [ "$choice" = "y" ]; then
    sed -i.bak "s/^\(PACKAGE=\).*/\1${PACKAGE/\//\\/}/" "$CONFIG_FILE"
    sed -i.bak "s/^\(DEFAULT_FILE=\).*/\1${DEFAULT_FILE/\//\\/}/" "$CONFIG_FILE"
    sed -i.bak "s/^\(SCORE_FILE=\).*/\1${SCORE_FILE/\//\\/}/" "$CONFIG_FILE"
    echo "s/^\(DEFAULT_FILE=\).*/\1${DEFAULT_FILE/\//\\/}/" "$CONFIG_FILE"
    echo "Changes applied."
else
    echo "Operation cancelled."
fi
