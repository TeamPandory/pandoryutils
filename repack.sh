#!/bin/bash

#34a2f2caf9de3b79541b7d22795213f7  ./cx1.2/had.zip
#160c18b9549eb077b72c26457c4937e3  ./cx1.2/rads.zip
#b995a0245d96a6eafc2422be56282d4a  ./cx1.2/hads.zip

#34a2f2caf9de3b79541b7d22795213f7  ./dx1.1/had.zip
#daefc008e8a2629778131c7190c70b38  ./dx1.1/hadc.zip
#7def0e6cb22b743962fcb50f0333d5c6  ./dx1.1/rade.zip

#e66949629a5d2637c4ed682765584c99  ./dx1.1jamma/had.zip
#afd1442815d3b93f3721b4d97eae31c4  ./dx1.1jamma/hadc.zip
#6205806af22fdd40150e14ec5aca2a8f  ./dx1.1jamma/rade.zip

#34a2f2caf9de3b79541b7d22795213f7  ./dx1.2/had.zip
#fd4264bc92f1839e3a85e1ecda00526b  ./dx1.2/hadc.zip
#8b52524cac994866b36083be460741da  ./dx1.2/rade.zip

#34a2f2caf9de3b79541b7d22795213f7  ./dx1.3/had.zip
#fd4264bc92f1839e3a85e1ecda00526b  ./dx1.3/hadc.zip
#8b52524cac994866b36083be460741da  ./dx1.3/rade.zip

#34a2f2caf9de3b79541b7d22795213f7  ./dx1.3console/had.zip
#95f47e5172b07e86d47060325f7e9507  ./dx1.3console/hadc.zip
#ac7d1bd514cbd4f4b6a7559e08189693  ./dx1.3console/rade.zip

#34a2f2caf9de3b79541b7d22795213f7  ./dx-koa2jamma/had.zip
#9eb812d6530e13113418122f7670aba7  ./dx-koa2jamma/hadc.zip
#c33947d5980d9753190909543d48a974  ./dx-koa2jamma/rade.zip


rm -rf /tmp/repack/dx-1.1/
rm -rf /tmp/repack/dx-1.1jamma/
rm -rf /tmp/repack/dx-1.2/
rm -rf /tmp/repack/dx-1.3console/
rm -rf /tmp/repack/dx-koa2jamma
rm -rf /tmp/repack/cx-1.2/

mkdir -p /tmp/repack/dx-1.1/
mkdir -p /tmp/repack/dx-1.1jamma/
mkdir -p /tmp/repack/dx-1.2/
mkdir -p /tmp/repack/dx-1.3console/
mkdir -p /tmp/repack/dx-koa2jamma
mkdir -p /tmp/repack/cx-1.2/

python3 filepack.py -e 'original/dx1.1/rade.zip' /tmp/repack/dx-1.1/rade/
python3 filepack.py -e 'original/dx1.1/had.zip' /tmp/repack/dx-1.1/had/
python3 filepack.py -e 'original/dx1.1/hadc.zip' /tmp/repack/dx-1.1/hadc/

python3 filepack.py -e 'original/dx1.1jamma/rade.zip' /tmp/repack/dx-1.1jamma/rade/
python3 filepack.py -e 'original/dx1.1jamma/had.zip' /tmp/repack/dx-1.1jamma/had/
python3 filepack.py -e 'original/dx1.1jamma/hadc.zip' /tmp/repack/dx-1.1jamma/hadc/

python3 filepack.py -e 'original/dx1.2/rade.zip' /tmp/repack/dx-1.2/rade/
python3 filepack.py -e 'original/dx1.2/had.zip' /tmp/repack/dx-1.2/had/
python3 filepack.py -e 'original/dx1.2/hadc.zip' /tmp/repack/dx-1.2/hadc/

python3 filepack.py -e 'original/dx1.3console/rade.zip' /tmp/repack/dx-1.3console/rade/
python3 filepack.py -e 'original/dx1.3console/had.zip' /tmp/repack/dx-1.3console/had/
python3 filepack.py -e 'original/dx1.3console/hadc.zip' /tmp/repack/dx-1.3console/hadc/

python3 filepack.py -e 'original/dx-koa2jamma/rade.zip' /tmp/repack/dx-koa2jamma/rade/
python3 filepack.py -e 'original/dx-koa2jamma/had.zip' /tmp/repack/dx-koa2jamma/had/
python3 filepack.py -e 'original/dx-koa2jamma/hadc.zip' /tmp/repack/dx-koa2jamma/hadc/

#python3 filepack.py -e 'original/cx1.2/had.zip' /tmp/repack/cx-1.2/had/
#python3 filepack.py -e 'original/cx1.2/hads.zip' /tmp/repack/cx-1.2/hads/  ## different encryption
#python3 filepack.py -e 'original/cx1.2/rads.zip' /tmp/repack/cx-1.2/rads/  ## different encryption


chmod +x retroarch
chmod +x xmame.SDL
# Delete weird passport photo from repacked firmware. Don't want that in there.
find /tmp/repack -name "0x312ffb03.bin" -exec rm {} \; -exec touch {}  \;
# Get down and funky.
find /tmp/repack/ -type d -name "config" -exec cp retroarch {}/../ \;
find /tmp/repack/ -type d -name "config" -exec cp fba {}/../ \;
find /tmp/repack/ -type d -name "config" -exec cp xmame.SDL {}/../ \;
find /tmp/repack/ -type d -name "config" -exec cp gamemenu {}/../ \;
find /tmp/repack/ -type d -name "config" -exec cp pipe2 {}/../ \;
# Silence, scum! Pt pt pt! https://www.youtube.com/watch?v=ubB4TRTBt-s
find /tmp/repack/ -type f -name "updown.wav" -exec cp -f empty.wav {} \;
find /tmp/repack/ -type f -name "page.wav" -exec cp -f empty.wav {} \;

rm -rf patched
mkdir patched
mkdir patched/dx1.1/
mkdir patched/dx1.1jamma/
mkdir patched/dx1.2/
mkdir patched/dx1.3console/
mkdir patched/dx-koa2jamma
mkdir patched/cx1.2/

python3 filepack.py -p /tmp/repack/dx-1.1/rade/rade.zip patched/dx1.1/rade.zip
python3 filepack.py -p /tmp/repack/dx-1.1/had/had.zip patched/dx1.1/had.zip
python3 filepack.py -p /tmp/repack/dx-1.1/hadc/hadc.zip patched/dx1.1/hadc.zip

python3 filepack.py -p /tmp/repack/dx-1.1jamma/rade/rade.zip patched/dx1.1jamma/rade.zip
python3 filepack.py -p /tmp/repack/dx-1.1jamma/had/had.zip patched/dx1.1jamma/had.zip
python3 filepack.py -p /tmp/repack/dx-1.1jamma/hadc/hadc.zip patched/dx1.1jamma/hadc.zip

python3 filepack.py -p /tmp/repack/dx-1.2/rade/rade.zip patched/dx1.2/rade.zip
python3 filepack.py -p /tmp/repack/dx-1.2/had/had.zip patched/dx1.2/had.zip
python3 filepack.py -p /tmp/repack/dx-1.2/hadc/hadc.zip patched/dx1.2/hadc.zip

python3 filepack.py -p /tmp/repack/dx-1.3console/rade/rade.zip patched/dx1.3console/rade.zip
python3 filepack.py -p /tmp/repack/dx-1.3console/had/had.zip patched/dx1.3console/had.zip
python3 filepack.py -p /tmp/repack/dx-1.3console/hadc/hadc.zip patched/dx1.3console/hadc.zip

python3 filepack.py -p /tmp/repack/dx-koa2jamma/rade/rade.zip patched/dx-koa2jamma/rade.zip
python3 filepack.py -p /tmp/repack/dx-koa2jamma/had/had.zip patched/dx-koa2jamma/had.zip
python3 filepack.py -p /tmp/repack/dx-koa2jamma/hadc/hadc.zip patched/dx-koa2jamma/hadc.zip

#python3 filepack.py -p /tmp/repack/cx-1.2/had/had.zip patched/cx1.2/had.zip

rm -rf prepped
mkdir prepped

find original -name '*.zip' -print0 | 
    while IFS= read -r -d '' line; do 
    	MD5SUM="$(md5sum "$line" | head -c 32)"
    	BASENAME="$(basename "$line")"
    	DIRNAME="$(basename $(dirname "$line"))"
    	
    	TARGET="$(pwd)/prepped/${MD5SUM}"
    	SRCDIR="$(pwd)/patched/${DIRNAME}"
    	SRCFILE="$SRCDIR/$BASENAME"
        
        if [[ -f "$SRCFILE" ]]
		then
	        echo $SRCFILE
			pushd "$SRCDIR"
	    	tar czvf "${TARGET}" ${BASENAME}
			popd
		fi
    done
exit;

