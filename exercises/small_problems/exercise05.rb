a = %w(a b c d e)
puts a.fetch(7) #error
puts a.fetch(7, 'beats me')#prints 'beats me'
puts a.fetch(7) { |index| index**2 }#prints 49

#fetch requires an index for an array as an argument.
#the index we give '7', is outside the scope
#of our index limit(the limit being 4), therefore we get
#an IndexError. 

#second example:
#adding a default argument, in this case, 'beats me'
#will keep #fetch from returning an exception
#because 7 is an invalid index,  #fetch will return
# the default value 'beats me', instead

#third example:
#Using a block acts similar to second example's default argument
#because 7 is an invalid index, our block is invoked:
#{ |index| index**2 }
#7 is used as substitute for 'index', therefore,
#the third example prints 49 because 7**2 = 49