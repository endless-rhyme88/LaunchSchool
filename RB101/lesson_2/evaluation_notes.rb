#From time to time, you may hear or read somebody saying 
#that precedence determines the order in which expressions 
#get evaluated. The evaluation process is more complicated 
#than just determining what gets evaluated first, though. 
#In fact, precedence in Ruby is only part of the story; 
#the other parts are either left-to-right evaluation, 
#right-to-left evaluation, short-circuiting, and ternary 
#expressions.

#Consider this code and the output it displays:

#def value(n)
  #puts n
  #n
#end

#puts value(3) + value(5) * value(7)

#outputs:
#3
#5
#7
#38

#From the first 3 lines of output, you might conclude 
#that Ruby is evaluating the expression left-to-right. 
#However, the final result says otherwise -- you can 
#only get that result if value(5) * value(7) gets 
#evaluated first. Which is it?

#It's a little of both. The issue here is that 
#operators like + and * need values that they can 
#work with. Method invocations like value(5) and 
#value(7) are not values. We can't invoke 
#the * operator until we know what values those 
#methods return. In an arithmetic expression, 
#Ruby first goes through an expression left-to-right 
#and evaluates everything it can without calling any 
#operators. Thus, here it evaluates value(3), value(5), 
#and value(7) first, in that order. Only when it has 
#those values does it deal with precedence and 
#re-evaluate the result.

#read about short circuting in your 
#"and_operator_notes.rb" file