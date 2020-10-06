#!/bin/bash

SUPPORTED_FILES=('.wav' '.wave' '.aif' '.aiff' '.flac' '.m4a')

USAGE="$LOGO
Stemgen is a Stem file generator. Convert any track into a stem and have fun with Traktor.

Usage: $0 -i [path]

Supported input file format: ${SUPPORTED_FILES[@]}
"
VERSION=1.0.0

INPUT_PATH=
BASE_PATH=
FILE_NAME=
FILE_EXTENSION=

get_cover() {
    echo "Extracting cover..."

    ffmpeg -i "$INPUT_PATH" -an -vcodec copy "output/$FILE_NAME/cover.jpg" -y

    echo "Done."
}

get_metadata() {
    echo "Extracting metadata..."

    ffmpeg -i "$INPUT_PATH" -f ffmetadata "output/$FILE_NAME/metadata.txt" -y

    echo "Done."
}



create_tags_json() {
    echo "Creating tags.json..."

    cd "output/$FILE_NAME"

    local path=$( cd "$(dirname "$FILE_NAME")" >/dev/null 2>&1 ; pwd -P )

    echo $path

    local tags=()

    # Add metadata, e.g. `artist` `genre`
    while IFS=$'\n' read tag; do
        title=${tag%%=*}
        title=$(echo "$title" | awk '{ print tolower($0) }')
        value=${tag##*=}
        if [[ $title == "title" ]]; then
            # Add meta `title` as `track` for `ni-stem`
            tags+=("track=${value}")
        elif [[ $title == "artist" ]] || [[ $title == "label" ]] || [[ $title == "genre" ]] || [[ $title == "release" ]] || [[ $title == "URL" ]] || [[ $title == "energylevel" ]]|| [[ $title == "INVOLVEDPEOPLELIST" ]] || [[ $title == "ISRC" ]]|| [[ $title == "initialkey" ]] || [[ $title == "publisher" ]]|| [[ $title == "beatgrid" ]] || [[ $title == "cuepoints" ]]|| [[ $title == "energy" ]] || [[ $title == "key" ]]|| [[ $title == "album_artist" ]] || [[ $title == "encoder" ]] || [[ $title == "comment" ]] || [[ $title == "release" ]]|| [[ $title == "lyrics" ]] || [[ $title == "album" ]]; then
            tags+=("${title}=${value}")
        fi
    done < metadata.txt

    # Add `cover`
    if [[ -e "cover.jpg" ]]; then
        tags+=("cover=file://${path}/cover.jpg")
    fi

    echo ${tags[@]}

    jo -p -- "${tags[@]:-}" > "$FILE_NAME.6.tags.json"

    for f in *_PN.5.master.6.tags.json; do
    mv -- "$f" "${f%_PN.5.master.6.tags.json}_PN.6.tags.json"
done

    for f in *.6.tags.json; do
    mv "$f" "/content/drive/My Drive/MyStems/spleeter"
done

    cd ../../

    echo "Done."
}


setup_file() {
    FILE_EXTENSION=$1
    FILE_NAME=${BASE_PATH%"$FILE_EXTENSION"}

    if [[ -d "output/$FILE_NAME" ]]; then
        echo "Working dir already created."
    else
        mkdir "output/$FILE_NAME"
        echo "Working dir created."
    fi
}

setup() {
    if [[ $("/content/Final_Stem_Creator/ni-stem" -h) == "" ]]; then
        echo "Please install ni-stem before running StemCreator."
        exit 2
    fi

    if [[ -d output ]]; then
        echo "Output dir already created."
    else
        mkdir output
        echo "Output dir created."
    fi

    BASE_PATH=${INPUT_PATH##*/}

    case "$INPUT_PATH" in
        *.wave)
            setup_file .wave
            cp "$INPUT_PATH" "output/$FILE_NAME/$FILE_NAME.wav"
            ;;
        *.wav)
            setup_file .wav
            cp "$INPUT_PATH" "output/$FILE_NAME/$FILE_NAME.wav"
            ;;
        *.aiff)
            setup_file .aiff
            convert_to_wav
            ;;
        *.aif)
            setup_file .aif
            convert_to_wav
            ;;
        *.flac)
            setup_file .flac
            convert_to_wav
            ;;
        *.m4a)
            setup_file .m4a
            convert_to_wav
            ;;
        *)
            echo "Invalid input file format. File should be one of:" ${SUPPORTED_FILES[@]}
            exit 1
            ;;
    esac

    echo "Ready!"
}

run() {
    echo "Generating a Stem file for $FILE_NAME..."

    get_cover
    get_metadata
    create_tags_json

    echo "Success! Have fun :)"
}

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
    -V | --version)
        echo $VERSION
        exit 0
        ;;
    -i | --input)
        shift; INPUT_PATH=$1
        ;;
    -h | --help)
        echo "$USAGE"
        exit 0
        ;;
    * )
        echo "$USAGE"
        exit 1
        ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

setup && run
