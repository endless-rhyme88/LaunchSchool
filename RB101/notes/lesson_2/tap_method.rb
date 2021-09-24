#Object instance method #tap:
  #Passes the calling object into a block, then returns 
  #that object.

array = [1, 2, 3]

mapped_array = array.map { |num| num + 1 }

mapped_array.tap { |value| value} #=> [2, 3, 4]

#another example

#mapped_array.tap { |value| value + 1 }
#raises a TypeError (no implicit conversion of Integer into Array)
  #This implies #tap is using the array 'mapped_array' as
  #an argument inside the block instead of using the 
  #integer literals inside said array.
  #This makes #tap potentially useful for debugging purposes
  

#Q: how is #tap different from irb? is its use more useful
#in actual projects compared to testing sections of code?(irb seems like the faster option)