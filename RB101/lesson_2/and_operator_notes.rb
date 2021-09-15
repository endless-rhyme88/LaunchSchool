#  && operator
#both expressions on either side of && must evaluate to a true object

#evaluates left to right, which means, it'll stop evaluting
#if can guarantee the return value:
#i.e. false && 3/0 # should raise an exception(ZeroDivisionError)
#however what is returned instead, is 'false' do to && first evaluating
#what is on the left of it and since what was left of it was a false object,
# it stopped there, since the whole expression would've evaluated to false.
#Thus avoiding evaluation of the ZeroDivisonError, right of it.
#This is called "Short Ciruiting"

#the same is true for the || operator. when it evaluates its first
#true expression, it will short circuit and return true
#i.e. true || 3/0 # => true

# && can be chained together

