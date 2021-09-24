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

#because in Ruby, everything, is considered true exepct nil and false
#you can even do things such as variable assignment and have 
#the expression evaluate to true
#i.e
#if  name = find_name
#  puts "got a name"
#else
#  puts "couldn't find it"
#end                     #the output will be "got a name"
#(careful not to mix variable assignment(=)
#with the comparison operator(==))

#REMEBER:everything in Ruby is considered truty except for
#nil and false
                            
                            