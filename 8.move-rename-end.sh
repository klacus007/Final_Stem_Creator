echo -e "Movendo e Renomeando...\n"

cd '/content/drive/My Drive/Musicas/03.Sleeper_m4a/'


for f in *.5.master.stem.m4a;do
mv "$f" "/content/drive/My Drive/Musicas/04.Backup_Stems/Colab_Stems/";done


cd "/content/drive/My Drive/Musicas/04.Backup_Stems/Colab_Stems/"

for f in *.5.master.stem.m4a; do
    mv -- "$f" "${f%_PN.5.master.stem.m4a}.stem.m4a"
done

cd '/content/drive/My Drive/Musicas/03.Sleeper_m4a/'

for f in *.5.master.m4a; do
    rm "$f"
done

for f in *.6.tags.json; do
    rm "$f"
done

for f in *_PN.5.master.aiff; do
    mv -- "$f" "${f%_PN.5.master.aiff}_PN.aiff"
done

for f in *.aiff; do
    mv "$f" "/content/drive/My Drive/Musicas/02.Platinum_Notes_aiff"
done

rm -rf "/content/drive/My Drive/Musicas/03.Sleeper_m4a/output"