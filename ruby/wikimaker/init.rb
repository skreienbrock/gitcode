# required packages
require 'erb'
require 'resolv'
require_relative 'classes/wikimaker'
require_relative 'classes/nmap2wiki'

@myrange=""
@mycidr=""

################ Testing
def test_classes
	x = Nmap2Wiki.new(@myrange,@mycidr)
	x.rangeokay?(x.iprange)
	x.fillNetwork(x.iprange)
	x.nmap2file
end

def run_wm
   puts "Welcome to wikimaker!\n---------------"
   first = Wikimaker.new
   first.counter=1
   first.items=0
   puts "#{first.counter} wikimaker object done."
   first.print_tableheader
   first.print_tabletopics
   # foreach item do |item|
   first.print_tablefield
   first.print_tablefooter
end

################ Main
printf("Test Address Range :> ")
@myrange = gets.chomp
printf("Range CIDR :> ")
@mycidr = gets.chomp
test_classes
run_wm
