require_relative 'colorize'

class Nmap2Wiki
	# we need arrays for
	# IPs, Hardware-Addresses, and the IPrange.
	attr_accessor :iprange,:cidr

	def initialize(range,cidr)
		@iprange = range
		@cidr = cidr.to_i
	end

	def nmap2file
		print colorize("running nmap on ",:bright_blue) 
		print colorize(@iprange,:bright_white) + "\n"
		# run code
	end

	def rangeokay?(testrange)
		# the given range should be a string like 127.0.0.0
		no_errors=true
		# check if IP range is correct:
		testme=testrange.split('.')
		if testme.size != 4
			no_errors=false
			exit 101
		else
		   testme.each do |octet|
		   	# check octets
			number = octet.to_i
			if !number.between?(0,255)
				no_errors=false
				exit 102
			end
 		   end
		end
		return no_errors
	end

	def fillNetwork(range)
		# fill a local hash with the IPs of the Range
		# hash should contain the following keys:
		# IP, MAC (Hardware-Address), Hostname (DNS)
		# given by range: Range, Netmask
		# cidr given?
		case
		when @cidr >= 8 && @cidr < 16
			# 255.0.0.0
			octetnum = 1
		when @cidr >= 16 && @cidr < 24
			# 255.255.0.0
			octetnum = 2
		when @cidr >= 24
			# 255.255.255.0
			octetnum = 3
		end
		network = range.split('.')[octetnum].to_i
		## debug output
		puts network.to_s(2)
	end

	def defineNetworkClass(cidr)
		# what kind of NetworkClass is this?
		# Class A (8)
		# Class B (16)
		# Class C (24)
		# Private Network Class
	end
	
	# resolve the ip (requires 'resolv')
	def resolve_ip ip
		return Resolv.getname ip
	end
end
