
for cfgfile in ~/.config/fish/config/*.fish
	echo "load $cfgfile .."
	. $cfgfile
end
