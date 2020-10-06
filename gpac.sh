!chmod -R 755 "/content/drive/My Drive/Programas/ni-stem-1.0/
cd "/content/drive/My Drive/Programas/ni-stem-1.0/"
git clone https://github.com/gpac/gpac.git
chmod -R 755 "/content/drive/My Drive/Programas/ni-stem-1.0/gpac/"
cd "/content/drive/My Drive/Programas/ni-stem-1.0/gpac/"
./configure --static-mp4box --use-zlib=no
make -j4