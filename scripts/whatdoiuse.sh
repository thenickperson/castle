#!/bin/bash

display_item() {
	if [ -n "$2" ]; then
		echo "$1 $2"
	fi
}

display_item "WM:        " $XDG_CURRENT_DESKTOP
display_item "Shell:     " $SHELL
display_item "Pager:     " $PAGER
display_item "CLI Editor:" $EDITOR
display_item "GUI Editor:" $VISUAL
display_item "Browser:   " $BROWSER
