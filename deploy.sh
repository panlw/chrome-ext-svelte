#!/bin/sh

basedir=~/Documents/chrome-exts
ext_dir=${basedir}/qrcode

rm -rf ${ext_dir} \
    && cp -pr dist ${ext_dir} \
    && cp -p manifest.json ${ext_dir}
