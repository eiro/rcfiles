if { which acpi > /dev/null && ${ON_A_LAPTOP=-false} } {
	battery_state () {
		#battery 0: charging, 15%, 00:02:33 until charged
		#battery 0: discharging, 16%, 00:00:42 remaining
		typeset battery percent state
		/usr/bin/acpi | ifs=, read battery percent state
		# state=${state#*:}
		print $state
	}

	ps1set () {
		typeset bat="$(battery_state)" stras="$(date +%H:%M)"
		export PS1="$stras .oO($bat) %B%n@%M%b:%d
	> "
	}
	precmd () { ps1set }

}
