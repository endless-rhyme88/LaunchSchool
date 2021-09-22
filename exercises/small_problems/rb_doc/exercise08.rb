#finfd documention for #min to print the lowest values
#in this array:

a = [5, 9, 3, 11]

#answer:
puts a.min(2)

#ome languages have a feature called multiple 
#inheritance (aka, MI). With MI, as it's often 
#abbreviated, a class can inherit from two or more 
#immediate superclasses. Inheriting from multiple 
#superclasses, though, has pitfalls. To avoid these 
#pitfalls, Ruby doesn't allow MI.

#Ruby uses something like MI, but without the 
#worst of the pitfalls. It's called mix-in modules, or, 
#more simply, mix-ins. Mix-ins provide a way for 
#classes of different types to share behaviors without 
#using inheritance.

#A class can use a mix-in module by using the include 
#method. Once included, all the mix-in's methods become 
#available to objects of the class