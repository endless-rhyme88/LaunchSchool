#exclude object methods
#exclude kernel methods
#exclude BasicObject methods

s = 'abc'
puts s.public_methods.inspect

#solution:

s = 'abc'
puts s.public_methods(false).inspect

#public_methods is a instance method from the Object class
#the parent class to the String class
#all sub-classes have access to methods of the class
#it's nested in; or the class that preceeds it
#keep that in mind if you don't see a particular 
#method in the class you are currently scanning through.
#If the sub-class' parent-class has a specific method listed
#all the sub-classes linked to it, have have acesses to
#that method, listed or not.

#NOTE:If the sub-class and superclass both have the same method,
#the sub-class' version of said method will take priority
#over the super-class' version.