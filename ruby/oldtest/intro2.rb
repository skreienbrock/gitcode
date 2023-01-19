#!/usr/bin/ruby

RED="\033[1;31m"
GRN="\033[1;32m"
NOC="\033[0m"

array=[1,2,3,4,5]
array.each do |element|
 printf RED + element.to_s + NOC
end

printf "\n"

1.upto(3) { |i| puts GRN + "Test " + i.to_s + NOC }

fruits=["apple","banana","pear"]
hash1_dictionary={:name => "Sven", :id => 1}

fruits.each { |element| puts element.capitalize }

