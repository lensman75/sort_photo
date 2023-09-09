#!/bin/bash
shopt -s nullglob # Включает режим nullglob

jpg_files=(*.jpg)
mp4_files=(*.mp4)

#find . -name '*.jpg' -o -name '*.mp4';
#test = find . -name '*.jpg' -o -name '*.mp4'
#echo ${name:0:2};
#echo $test;


photoname=()
for file in *.jpg; do
    photoname+=("$file")
done
for file in *.mp4; do
    photoname+=("$file")
done
#for [[file in *.jpg || file in *.mp4]]
#for file in *.jpg *.mp4
##do
##	photoname=(${photoname[@]} "$file")
##done
#echo "${photoname[1]:0:4}"
#echo "${photoname[1]:4:2}"
#echo "${photoname[1]:6:2}"
echo 'right_name'
echo "${photoname[1]:0:4}-${photoname[1]:4:2}-${photoname[1]:6:2}"
#echo ""
#mkdir "${filename[1]:0:4}-${filename[1]:4:6}-${filename[1]:6:8}"
echo "${#photoname[@]}"
echo "${photoname[@]}"

photos=${#photoname[@]}
echo "$photos"
#for i in $(seq 0 $photos); do echo ${photoname[$i]}; done
echo '---'
for i in $(seq 0 $photos); do echo ${photoname[i]:0:4}-${photoname[i]:4:2}-${photoname[i]:6:2}; done
for i in $(seq 0 $photos);
do
	#dir_name="${photoname[i]:0:4}-${photoname[i]:4:2}-${photoname[i]:6:2}"
    #mkdir -p "$dir_name"
    #mv "${photoname[i]}" "$dir_name/"
    dir_name="${photoname[i]:0:4}-${photoname[i]:4:2}-${photoname[i]:6:2}"
    
    if [[ $dir_name =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        mkdir -p "$dir_name"
        mv "${photoname[i]}" "$dir_name/"
    else
        echo "Ошибка: '$dir_name' не является допустимым именем директории для файла '${photoname[i]}'"
    fi
done
