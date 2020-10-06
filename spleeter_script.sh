#!/bin/bash
apt update
apt dist-upgrade -y
apt autoremove
apt install ffmpeg
apt autoremove
pip install pandas==0.25.1


