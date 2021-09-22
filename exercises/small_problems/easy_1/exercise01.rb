#write a method that takes two arugments
  #a string and a positive integer
#print the string as many times correlated with the integer

#def repeat(str, int)
  #until int == 0 
    #puts str
    #int -= 1
  #end
#end


def repeat(str, int)
  int.times { puts str }
end

repeat('Hello', 3)