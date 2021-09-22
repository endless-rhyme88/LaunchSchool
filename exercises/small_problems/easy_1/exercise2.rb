#create method that takes one intger argument
#method returns true if absolute value is odd

#def is_odd?(int)
  #int % 2 == 1
#end

#or

def is_odd?(int)
  int.remainder(2) == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

#To determine if a number is odd without using #odd? or 
#even?, we must check whether the number modulo 2 is 1. 
#In Ruby, we use % to perform modulo operations, so we 
#use it here to determine whether the number is odd.

#his solution relies on the fact that % is 
#the modulo operator in Ruby, not a remainder operator 
#as in some other languages. Remainder operators 
#return negative results if the number on the left is 
#negative, while modulo always returns 
#a non-negative result if the number on 
#the right is positive