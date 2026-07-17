#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

pkg update -y
pkg install -y git python cmake ninja build-essential pkg-config libicu capstone fmt
python -m pip install --upgrade pip
python -m pip install requests pyelftools

if [ ! -d blutter-termux ]; then
  git clone https://github.com/dedshit/blutter-termux.git
fi

cd blutter-termux
printf '%s\n' 'Instalasi selesai.' 'Jalankan: python blutter.py /path/app.apk output'
