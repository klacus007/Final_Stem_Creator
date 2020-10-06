cd "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff"

for f in *_PN.aiff; do
    mv -- "$f" "${f%_PN.aiff}_PN.5.master.aiff"
done

for f in *_PN.5.master.aiff; do
    mv "$f" "/content/drive/My Drive/Musicas/03.Sleeper_m4a"
done

