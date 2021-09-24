#error messages
  #found at the top of the exception
  #it tells you the type of error
  #i.e.: NoMethodError,
  #the line the error was produced on
  #and a brief explanintion of why an exception was raised
  #i.e. NoMethodError: undefined method 'name' for nil:NilClass

#some online resources to help find a remedy:
  #Search Engine
  #Stack Overflow
  #(Ruby) Documentation

#steps to Debugging:
  #1)Reproduce the Error
  #2)Determine the Boundaries of the Error
    #the goal is to try and modify the data or code to get  
    #an idea of the scope of the error and determine the 
    #boundaries of the problem.
  #3)Trace the Code
  #4)Understand the Problem Well
  #5)Implement a Fix
  #6)Test the Fix

#One very important note is to fix one problem at a 
#time. It's common to notice additional edge cases or 
#problems as you're implementing a fix. Resist the 
#urge to fix multiple problems at once.

#Techniques for Debugging
#1)Line by Line
  #Most bugs in your code will be from overlooking a 
  #detail, rather than a complete misunderstanding of 
  #a concept. Being careful, patient and developing a 
  #habit of reading code line-by-line, word-by-word, 
  #character-by-character is your most powerful ability 
  #as a programmer.
#2)Rubber Duck Method
#3)Walking Away
#4)Using Pry
#5)Using a Debugger