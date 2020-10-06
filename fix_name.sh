find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//./ }"' bash {} \;

find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//aiff/.aiff}"' bash {} \;

find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1// .aiff/.aiff}"' bash {} \;

find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//../.}"' bash {} \;

find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//%/per cent}"' bash {} \;

find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//,/, }"' bash {} \;

find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//"/ }"' bash {} \;

find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//$/S}"' bash {} \;

find "/content/drive/My Drive/MyStems/originals/" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//  / }"' bash {} \;
