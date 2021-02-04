#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/rofi/colors.rasi"
I3FILE="$HOME/.config/regolith/Xresources"

# Get colors
#pywal_get() {
#	wal -i "$1" -q -t
#}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = #${BG}/g" $PFILE
	sed -i -e "s/background-alt = #.*/background-alt = #8C${BG}/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = #${FG}/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = #33${FG}/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	sed -i -e "s/i3-wm.client.focused.color.background: #.*/i3-wm.client.focused.color.background: $AC/g" $I3FILE
	sed -i -e "s/i3-wm.client.focused.color.child_border: #.*/i3-wm.client.focused.color.child_border: $AC/g" $I3FILE

	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:   #00000000;
	  bg:   #${BG}BF;
	  bga:  #${BG}FF;
	  fg:   #${FG}FF;
	  ac:   ${AC}FF;
	  se:   ${AC}1A;
	}
	EOF
	
	#polybar-msg cmd restart
	regolith-look refresh
}

# Main
	if [[ "$1" ]]; then
	#	pywal_get "$1"

		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		BGC=`printf "%s\n" "$background"`
		BG=${BGC:1}
		FGC=`printf "%s\n" "$foreground"`
		FG=${FGC:1}
		AC=`printf "%s\n" "$color1"`

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
