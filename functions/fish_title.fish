function fish_title
    if [ -n "$argv[1]" ]
    	echo $argv[1] "(in " (pwd) ")"
    else
	echo (pwd)
    end
end
