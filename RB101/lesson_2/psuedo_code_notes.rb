#Pseudo-code is meant for humans to read. It's not meant for 
#machines or programs to process, and therefore there's no rigid 
#format to follow. Human brains are far more flexible and powerful 
#than programming language interpreters or compilers.

#i.e.

#Given a collection of integers.

#Iterate through the collection one by one.
  #- save the first value as the starting value.
  #- for each iteration, compare the saved value with the current value.
  #- if the saved value is greater, or it's the same
    #- move to the next value in the collection
  #- otherwise, if the current value is greater
    #- reassign the saved value as the current value

#After iterating through the collection, return the saved value.

#When you first approach any problem, it's important to try to 
#understand it well. In order to do that, you have to spend time 
#to load the problem into your brain. Only then can you start to 
#dissect it, understand it, and come up with an execution path 
#to solve it.


#the process is as such:
# -first identify that there is a problem
# -next formulate a logic that addresses send problem(psuedo-code)
# -than translate your logic in a way that can be understood by Ruby
#  (the actual coding)

#formal Pseudo-Code keywords
#START 	             >>     start of the program

#SET 	               >>     sets a variable we can use for later

#GET 	               >>     retrieve input from user

#PRINT 	             >>     displays output to user

#READ 	             >>     retrieve value from variable

#IF / ELSE IF / ELSE >>	    show conditional branches in logic

#WHILE 	             >>     show looping logic

#END 	               >>     end of the program

#the keywords will help better structure your psuedo-code
#and improve readability

#i.e.

#START

# Given a collection of integers called "numbers"

#SET iterator = 1
#SET saved_number = value within numbers collection at space 1

#WHILE iterator <= length of numbers
  #SET current_number = value within numbers collection at space "iterator"
  #IF saved_number >= current_number
    #go to the next iteration
  #ELSE
    #saved_number = current_number

  #iterator = iterator + 1

#PRINT saved_number

#END

# Though detailed it may be, this pseudo-code still suffers 
#from the same problem -- we can't verify that this logic is 
#actually sound. To test the logic, we need to translate it into 
#program code.

def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num  # assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

#you won't be able to detail out the entire problem first in 
#pseudo-code, then translate all of it into Ruby. If you did, 
#you'd likely discover that a lot of your logic or assumptions 
#in the pseudo-code is incorrect, and you'll need to make some 
#changes that will ripple across the entire program, forcing you 
#to start over time and again. 
#Remember, pseudo-code is a guess at the solution and there's 
#no verification that the logic is correct. Only when you 
#translate it to actual programming code is the logic being 
#verified.