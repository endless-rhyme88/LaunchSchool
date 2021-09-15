#how is the class method ::path different from instance method #path?

#calls the class method File::path since we're calling it on 
#the File class
puts File.path('bin')

#calls the instance method File#path since we're calling it 
#on an object of the File class, namely f
f = File.new('my-file.txt')
puts f.path


