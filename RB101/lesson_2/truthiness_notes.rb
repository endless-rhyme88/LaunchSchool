#truthiness values usually utilize boolean 
#data types(&&, ||, ==, ...)
#the only purpose for boolean objects, is to convey whether
#it is true or false

#true and false have classes(TrueClass, FalseClass,..)
#and can be chainned to other methods
#i.e. true.to_s #=> "true"

#true and false objects can be used and conditonals but the
#expression will always evaluate to the corresponding object if
#called explictly
#i.e. 
#if true
#  puts 'hi'
#else
#  puts 'goodbye'
#end              # will always output 'hi' due to explictly calling true

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