#better integer validation
#number validation(for divsion)

#option 1
#
#
def integer?(input)
  inputs.to_i.to_s == input
end

#This isn't perfect, however, because while "0" will 
#return true, if we input "00", this method will 
#return false.

#option 2
#
#
#def integer?(input)
  #/^-?\d+$/.match(input)
#end

#we're using the \d regular expression to test against 
#all digits. The ^ means start of string, the + means 
#"one or more" (of the preceding matcher), and the $ 
#means end of string. Therefore, it has to be an 
#integer, and a float, like 4.5 won't match. 
#When there's a match, the match method will return 
#a MatchData object, which will evaluate to true. 
#When there's no match, it'll return nil, which 
#will evaluate to false.

#option 3
#
#
#def integer?(input)
  #Integer(input) rescue false
#end

#use built-in conversion method. In Ruby, there's 
#a method called Kernel#Integer that will convert 
#parameters to the method into an integer object. 
#It will, however, raise a TypeError if the input 
#is not a valid integer, so you'll have to handle that.

#Note: trailing rescue is a "code smell", so be 
#aware of that. In this specific instance, 
#it's ok, but don't fall into a habit of 
#suppressing errors this way.


#attempts
#
#
#def valid_number?(num)
  #if num != String 
    #num
  #end
#end

#def divison?(num1, num2)
    #valid_number?.div(valid_number?)
#end


#number1 = gets.chomp.to_f 
#number2 = gets.chomp.to_f

#results = valid_number?(number1) / valid_number?(number2)

#p divison?
 
 
#p results