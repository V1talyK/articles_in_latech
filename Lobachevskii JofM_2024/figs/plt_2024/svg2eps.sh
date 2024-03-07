# !/bin/bash
# https://stackoverflow.com/questions/30242672/inkscape-command-line-need-to-convert-svg-to-eps-without-filter-rasterisation

#for i in $(ls *.svg); do
#	printf "$i\n"
#	BN=$(basename $i .svg)
#	inkscape "$BN.svg" -E "$BN.eps" --export-ignore-filters --export-ps-level=3
#  
#  #inkscape --without-gui --export-png="$BN.png" --export-dpi 300 $i
#  #convert -compress LZW -alpha remove $BN.png $BN.tiff
#  #mogrify -alpha off $BN.tiff
#  #rm $BN.png
#done

echo "Input: $@"
echo "Parameters number: $#"
echo

if [ "$#" -eq 0 ]; then
    echo "Обработка всех .svg"

	for i in $(ls *.svg); do
		printf "$i\n"
		BN=$(basename $i .svg)
		inkscape "$BN.svg" -E "$BN.eps" --export-ignore-filters --export-ps-level=3
	done
else
	echo "Обработка списка .svg"

	for i in $@; do
		printf "$i\n"
		BN=$(basename $i .svg)
		inkscape "$BN.svg" -E "$BN.eps" --export-ignore-filters --export-ps-level=3
	done
fi

printf "done\n"
