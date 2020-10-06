echo -e "Movendo e Renomeando...\n"

cd '/content/drive/My Drive/MyStems/spleeter/'


for f in *.5.master.stem.m4a;do
mv "$f" "/content/drive/My Drive/MyStems/stems/";done


cd "/content/drive/My Drive/MyStems/stems/"

for f in *.5.master.stem.m4a; do
    mv -- "$f" "${f%.5.master.stem.m4a}.stem.m4a"
done

cd '/content/drive/My Drive/MyStems/spleeter/'

for f in *.5.master.m4a; do
    rm "$f"
done

for f in *.6.tags.json; do
    rm "$f"
done

for f in *.5.master.aiff; do
    mv -- "$f" "${f%.5.master.aiff}.aiff"
done

for f in *.aiff; do
    mv "$f" "/content/drive/My Drive/MyStems/originals"
done

rm -rf "/content/drive/My Drive/MyStems/spleeter/output"
