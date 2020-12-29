#!/bin/bash

for i in `find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n'`; do    #iterate through all subdirectories in directory
	cd $i;
	chmod a+rw *.mp3     #ensure permissions are enabled
	for j in `ls *.mp3`; do      #iterate through all mp3 files in each subdirectory
		name=$(echo "$j" | cut -f 1 -d '.')   #retrieve file name without extension
		echo $name;
		avconv -i $name.mp3 -vn $name.wav  #actual conversion using avconv binary; avconv binary can be compiled from source from https://libav.org/download 
	done
	cd ..
done

#loads of instrument samples can be downloaded from 
#https://philharmonia.co.uk/resources/sound-samples/
#make thisscript.sh exectutable by entering in terminal "chmod a+x /path/to/thisscript.sh"
#unpack the samples into subdirectories (without spaces or quotes in directory name), within a master directory where you run this script ./thisscript.sh
#now the mp3 files you downloaded are converted into ogg files which can be used in LMMS
