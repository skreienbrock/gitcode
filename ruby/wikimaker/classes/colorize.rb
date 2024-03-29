def colorize(value, color)
	case color
		when :black then "\e[30m" + value.to_s + "\e[0m"
		when :red then "\e[31m" + value.to_s + "\e[0m"
		when :green then "\e[32m" + value.to_s + "\e[0m"
		when :yellow then "\e[33m" + value.to_s + "\e[0m"
		when :blue then "\e[34m" + value.to_s + "\e[0m"
		when :magenta then "\e[35m" + value.to_s + "\e[0m"
		when :cyan then "\e[36m" + value.to_s + "\e[0m"
		when :white then "\e[37m" + value.to_s + "\e[0m"
		when :bright_black then "\e[1m\e[30m" + value.to_s + "\e[0m"
		when :bright_red then "\e[1m\e[31m" + value.to_s + "\e[0m"
		when :bright_green then "\e[1m\e[32m" + value.to_s + "\e[0m"
		when :bright_yellow then "\e[1m\e[33m" + value.to_s + "\e[0m"
		when :bright_blue then "\e[1m\e[34m" + value.to_s + "\e[0m"
		when :bright_magenta then "\e[1m\e[35m" + value.to_s + "\e[0m"
		when :bright_cyan then "\e[1m\e[36m" + value.to_s + "\e[0m"
		when :bright_white then "\e[1m\e[37m" + value.to_s + "\e[0m"
		else value.to_s
	end
end
