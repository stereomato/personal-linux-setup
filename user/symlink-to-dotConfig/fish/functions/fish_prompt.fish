function fish_prompt
	set -l last_pipestatus $pipestatus
	set -lx __fish_last_status $status
			
	if not set -q VIRTUAL_ENV_DISABLE_PROMPT
		set -g VIRTUAL_ENV_DISABLE_PROMPT true
	end

	# colorScheme has the value 'prefer-dark', had to escape the first ' to make this work. 	Dang.
	# However, this caused another issue, with VScode syntax highlight. So I just used sed (as seen above) to cut out the godforsaken quotations.
	set colorScheme (gsettings get org.gnome.desktop.interface color-scheme | sed "s/'//g")
					
	# $GNOME_SETUP_DISPLAY isn't set on TTYs, so this can be used to set the dark theme on ttys (and whatever other environment that might not be GNOME or doesn't set this variable)
	# That said, there's the "$prompt_use_dark_mode" variable, just in case to force this 
	if test "$colorScheme" = "prefer-dark" -o -z "$GNOME_SETUP_DISPLAY" -o -n "$prompt_use_dark_mode"
		switchColorschemes --prompt --skipSettingColors --darkMode
	else
		switchColorschemes --prompt --skipSettingColors
	end

	if test $USER = root
		set_color red
		printf '%s' $USER
		set_color normal
	else
		set_color $fish_color_user
		printf '%s' $USER
		set_color normal
	end
						
	printf ' at '

	set_color $fish_color_host
	echo -n (prompt_hostname)
	set_color normal
	printf ' in '

	set_color $fish_color_cwd
	printf '%s' (prompt_pwd)
	set_color normal
				
	if test $SHLVL -gt 1
		printf ' with'
		set_color $pearsche_fish_color_stack
		printf ' %u' $SHLVL
		set_color normal
		printf ' stacks'			
	end

	if test $__fish_last_status -ne 0
		set_color $fish_color_error
		printf ' [%s]' $__fish_last_status
		set_color normal
	end
						
	if test -n "$VIRTUAL_ENV"
		printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
	end
	printf ' %% '
	set_color normal
end
