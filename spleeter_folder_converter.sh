cd "/content/drive/My Drive/MyStems/originals"

bash "./fix_name.sh"

for f in *.*; do spleeter separate -B tensorflow -c m4a -p "./base_config.json" -f "{filename}.{instrument}.{codec}" -i "$f" -o "/content/drive/My Drive/MyStems/spleeter" ; done 