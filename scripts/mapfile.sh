#!/bin/bash -e

# Description
#   This script generates ESGF mapfile.
#   Processes by dataset.

# --------- arguments & initialization --------- #

while [ "${1}" != "" ]; do
    case "${1}" in
        "--project")         shift; project="${1}"       ;;
        "--dataset_pattern") shift; input_dataset="${1}" ;;
        #"--input-dir")       shift; src_path="${1}"     ;;
        "--script-dir")      shift; scripts_path="${1}"  ;;
    esac
    shift
done

source ${scripts_path}/functions.sh

# INI files directory
ESGCET_PATH="/esg/config/esgcet/"
# Root path
#ROOT_PATH="/path/to/synda/root/data"
#ROOT_PATH="/prodigfs/prodigfs_test/esgf/mirror/"
# Mapfile directory
MAP_PATH="/home/esg-user/mapfiles/"

# --------- main --------- #

msg "INFO" "mapfile.sh started"

esgprep mapfile -i ${ESGCET_PATH} -v \
                --project ${project,,} \
                --outdir ${MAP_PATH} \
                --max-threads 16 \
                ${src_path}
                #${ROOT_PATH}${input_dataset}

msg "INFO" "mapfile.sh complete"
