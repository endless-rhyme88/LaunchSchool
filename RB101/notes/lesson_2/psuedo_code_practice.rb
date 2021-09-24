#psuedo-code(casual):
#-create method def. 
# -set parameter that takes two intgers 
# -set a variable to the sum of the given integers
#  -print it
#end
#call method def.

#Translation:
def sum(a, b)
  result = a + b
  "The sum of #{a} and #{b} is #{result}."
end  

puts sum(79, 9)
#
#
#psuedo-code(formal)

#START

#SET def concat(string1, string2, string3)
       #SET array = [string1, string2, string3]
       #SET array.sum()
     #END
       
     #SET concat()
     #END

#Translation:
def concat(str1, str2, str3)
  array = [str1, str2, str3]
  array.sum("")
end

concat("hello ", "world, ", "how are you?")
#
#
#pseudo-code(formal)
#START

#SET def even_only
       #SET array = []
       #SET array.insert(0, rand(100)) UNTIL array.size == 5
       #SET array.each DO |int|
              #PRINT int IF int.even?
            #END
    #END
       
    #SET even_only
#END

#Translation:
def even_only
  array = []
  content = array.insert(0, rand(100)) until array.size == 5
  content.each do |int|
    puts int if int.even?
  end
end

even_only
