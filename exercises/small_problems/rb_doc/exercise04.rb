a = [1, 4, 8, 11, 15, 19]

a.bsearch { |i| i > 8 }

#prints 11

#bsearch uses the elements inside the array as a return value
#bsearch uses the first element that meets the conditons set 
#returns it, in this case, 11. If we removed 11, the first
#number to meet the conditons would have been 15, then 19 etc..
#if there were no elements greater than 8, then nil would have been returned
#bsearch has two modes:find-minimum and find-any
#the example above is using 'find-minimum'

#example of find-any: { |i| i > 8 / -1 } => 1

#note requires #bsearch requires the array to be ordered 
#from least to greatest or the reversed(sorted)
#[1, 2, 3, 4](valid), 
#[4, 3, 2, 1](valid), 
#[3, 4, 1, 2] invalid syntax

#note this method doesn't except 0 as an arguments
#(produces ZeroDivisonError)

#note the block must always return true or false.
#thoug < operator will always result in false(nil)
