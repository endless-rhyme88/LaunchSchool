def number?(input)
  integer?(input) || float?(input)
end

#We already have the integer? method, so all we need to do 
#is implement a float? method.

#option 1
#
#
#def float?(input)
  #input.to_f.to_s == input
#end

#option 2
#
#
#def float?(input)
  #/\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
#end

#This regex is similar to the regex in the 
#integer? method, except we have to account for more 
#possible formats. We can combine two validations to 
#verify that the input is a valid float. 
#The first validation verifies that there is at 
#least one digit in the input. The second validation 
#incorporates the * which stands for "zero or more", 
#and the ? which stands for "zero or one". 
#This validation can be read as "zero or more digits, 
#followed by an optional period, 
#followed by zero or more digits. 
#This validation will accept all of these 
#formats: 11.11, 11., .11, but not a period by itself. 
#Notice that we had to prefix the . with a backslash. 
#That is because . matches any single character in 
#regex. By escaping it, we tell Ruby that we are 
#looking for the actual period character.

#option 3
#
#
#
#def float?(input)
  #Float(input) rescue false
#end

#use the Kernel#Float method, which is analogous to the 
#Kernel#Integer method from earlier. Just like that 
#method, Float also raises an exception if you don't 
#give it a valid float, so you have to handle it.