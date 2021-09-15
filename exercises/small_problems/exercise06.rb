5.step(to: 10, by: 3) { |value| puts value } # prints 5, 8

#the numeric class instance method #step has 4 calling signatures
#but this example is using 
#step(by: step, to: limit) { |i| block } → self 

#this version of #step takes two keyword/named arguments,
#:by and :to
#step is using :to as a limit and :by as a "step" value
#where the number prepend is where the method begins its iteration
#in this example we are essentially saying:
#"starting at 5, add up to 10 by 3" and is why the code prints
#5 and 8
#because the next number would be 11, ruby stops iterating at 8
#as we would otherwise go over our limit

#note #step's keyword arguments are optional, if no value is
#give to :to, :to will default to infinty so 5.step(by: 3)
#will default to an infinite loop that starts at 5 and goes up by 3
#if :by isn't given a value, it will default to 1
#so 5.steps(to: 10)
#will iterate up to 10, by 1, and starts 5