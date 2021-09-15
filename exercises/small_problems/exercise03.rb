def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

#prints [4, 5, 3, 6]

#default positional arguments allows for use default arguments
#when one isn't given. We call our method and pass in the
#arguments: 4, 5, 6; so now the values are assigned by position
#a gets assigned, then b, etc.. a = 4 and we override b's default
#value and assign it 5. However, we only have one value left '6'
#but one of the remainning arguments, 'd' wasn't assigned a default
#value, so it gets priority over 'c' in assigning since c has 
#a default value of '3'. Therefore are outputs prints:
#[4, 5, 3, 6]