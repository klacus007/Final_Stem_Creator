find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//./ }"' bash {} \;

find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//aiff/.aiff}"' bash {} \;

find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1// .aiff/.aiff}"' bash {} \;

find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//../.}"' bash {} \;

find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//%/per cent}"' bash {} \;

find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//,/, }"' bash {} \;

find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//"/ }"' bash {} \;

find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//$/S}"' bash {} \;

find "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff" -depth -name '* *' \
    -execdir bash -c 'mv -- "$1" "${1//  / }"' bash {} \;