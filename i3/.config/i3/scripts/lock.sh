#!/usr/bin/env bash

TIME='#ffffffff'
PRIMARY='#000000ff'

i3lock  --time-color=$TIME\
	--date-color=$TIME\
	--color=$PRIMARY\
	--clock\
	--time-size=100\
	--date-size=40\
	--date-pos=tx:ty+80\
	--time-str="%H:%M"\
	--date-str="%A, %d-%m-%Y"\
	--time-font="JetBrainsMono Nerd Font"\
	--date-font="JetBrainsMono Nerd Font"\
	--screen 1\
