#The meaning of an expression in Ruby is determined by 
#what is called operator precedence. It’s a set of rules 
#that dictate how Ruby determines what operands each 
#operator takes. Operands are simply values -- the 
#results of evaluating expressions -- that are used 
#by the operator.

#In an expression, operators with higher precedence are 
#prioritized over those with lower precedence. 
#any example is the *  operator. * has higher precedence 
#than +, so * would get passed before +, in an expression
#If wanted to prioritze specific operator first,
#you can put paranthesis around it and its opperand(s).

#i.e. 3 + 5 * 7 evaluates to 38 due to *, being higher
#in the priority list than +. but if you  parantheses
#around the it and the opperands it is bound to
#like this:(3 + 5) * 7, you'd get a different value,
#56 due to the + operator now taking higher priority
#over *

#IMPORTANT:
  #Really. Don't rely on the precedence rules when you're 
  #mixing operators; use parentheses whenever you mix 
  #operators in an expression. If you don't bother with 
  #the parentheses, you'll eventually decide to work from 
  #memory. Sooner or later you'll misremember the rule, 
  #and introduce a nice little bug into your code. 
  #Someone reading your code may not be as familiar 
  #with the precedence rules as you. They will either 
  #have to look up the rules, or assume that you knew 
  #what you were doing when you wrote the code. If they 
  #assume that you knew what you were doing, they will 
  #miss the bug.