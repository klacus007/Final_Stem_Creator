cd "/content/drive/My Drive/MyStems/originals"

for f in *.aiff; do
    mv -- "$f" "${f%.aiff}.5.master.aiff"
done

for f in *.5.master.aiff; do
    mv "$f" "/content/drive/My Drive/MyStems/spleeter"
done

