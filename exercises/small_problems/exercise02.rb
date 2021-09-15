require 'date'

puts Date.civil#no arguments buts this method can use default values
puts Date.civil(2016) #optional #defaults month, mday, and start
puts Date.civil(2016, 5)#optional #defaults mday, and start
puts Date.civil(2016, 5, 13)#optional #defaults start

#examples of optional arguments