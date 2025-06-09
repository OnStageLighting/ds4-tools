!/bin/bash
echo ".........MENU........"
filename=$(date +'%Y%m%d%H%M')
option=(
"Create Dump File"
"Set Write Status On"
"Calibrate Controller"
"Set Write Status Off and QUIT"
"Quit"
)
PS3="Select number and press ENTER: "
select selection in "${option[@]}"
do
case "$selection" in
"${option[0]}" ) echo Dump File ; sudo python3 ds4-tool.py dump-flash dumps/${filename}.bin;;
"${option[1]}" ) echo Write Status On; sudo python3 ds4-tool.py set-flash-mirror-status 0 ;;
"${option[2]}" ) echo Calibrate;sudo python3 ds4-calibration-tool.py
	;;
"${option[3]}" ) echo Status Off; sudo python3 ds4-tool.py set-flash-mirror-status 1; exit;;
"${option[4]}" ) echo Goodbye; exit;;
esac
done
