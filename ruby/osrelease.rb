#!/usr/bin/ruby

class PrintX
 @@CLRS={:red=>"\033[1;31m",:green=>"\033[32m",:default=>"\033[0m",
	 :yellow=>"\033[1;33m",:blue=>"\033[1;34m",:white=>"\033[1;37m"}
 def wrbox(string,symbol)
    puts "["  + @@CLRS[symbol] + "*" + @@CLRS[:default] + "] " + string
 end

 def wrfbox(string,symbol)
    puts "["  + @@CLRS[symbol] + "-" + @@CLRS[:default] + "] " + @@CLRS[:white] + string + @@CLRS[:default]
 end

 def readfile(file)
    fh = File.new(file,'r')
    while line = fh.gets
      self.wrfbox(line.chomp,:blue)
    end
 end
end

printx=PrintX.new
printx.wrbox("Another one bites the dust",:red)
printx.wrbox("Another one bites the dust",:green)
printx.wrbox("Another one bites the dust",:blue)
printx.wrbox("Another one bites the dust",:yellow)
printx.readfile("/etc/os-release")

print "Give me a color (1-7):> "
x=gets
print "Give me your font type (1-7):> "
y=gets
# y:
# 0 = no change in style
# 1 = bold
# 2 = darker
# 3 = italic
# 4 = underline
# 5 = blink
puts "\033[" + y.chomp + ";3" + x.chomp + "m" + "Your string color of choice" + "\033[0m"
