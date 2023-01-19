#!/usr/bin/ruby
puts 123
print 345
puts 678
# another comment.

# VARIABLES (are not objects)
# either undefined or act like an object
# RUBY: everything is an object!
x="Hello".reverse
print x + " "
puts "everything is an object!"
puts x.upcase

# Global: 	$var
# Class:  	@@var
# Instance: 	@var
# Local:	var
# Block:	var

# in which integer class is my number ?
#irb(main):006:0> 1234.class
#=> Integer (früher Fixnum)
#irb(main):007:0> 123456789123456789.class
#=> Integer (früher Bignum)

#irb(main):026:0> x = 10.0
#=> 10.0
#irb(main):027:0> x.class
#=> Float
#irb(main):028:0> 10.0.class
#=> Float

#irb(main):029:0> 10 / 3
#=> 3
#irb(main):030:0> 10.0 / 3
#=> 3.3333333333333335
#irb(main):031:0> 10 / 3.0
#=> 3.3333333333333335

#irb(main):032:0> y = 10 / 3.0
#=> 3.3333333333333335
#irb(main):033:0> y.to_i
#=> 3
#irb(main):034:0> y.round
#=> 3
#irb(main):035:0> y
#=> 3.3333333333333335
#irb(main):036:0> y.floor
#=> 3
#irb(main):037:0> y.ceil
#=> 4

# STRINGS
ud_border = "+" + "-"*20 + "+"
greeting  = "|" + " "*4 + "Hello  there" + " "*4 + "|"

puts ud_border
puts greeting
puts ud_border

greet1 = "Hello"
greet2 = "World"
puts "This is my #{greet1} #{greet2} string"

# ARRAYS and ARRAY METHODS
data_set = []
data_set = ["a","b","c"]
puts data_set[2]
data_set[3] = "d"
data_set << "e"

#irb(main):017:0> a << 5
#=> [1, 4, 2, 3, 0, 5]
#irb(main):018:0> a.sort!
#=> [0, 1, 2, 3, 4, 5]
#irb(main):019:0> a
#=> [0, 1, 2, 3, 4, 5]
#irb(main):020:0> a.pop
#=> 5
#irb(main):021:0> a
#=> [0, 1, 2, 3, 4]
#irb(main):022:0> a.shift
#=> 0
#irb(main):023:0> a.unshift(1)
#=> [1, 1, 2, 3, 4]
#irb(main):024:0> a
#=> [1, 1, 2, 3, 4]
#irb(main):025:0> a.uniq!
#=> [1, 2, 3, 4]

