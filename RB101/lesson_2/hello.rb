Kernel.puts("hello world")  #additonal notes for rubocop

#CLI:
#$ rubocop hello.rb

#outputs:

#Inspecting 1 file
#C

#Offenses:

#hello.rb:1:1: C: Style/FrozenStringLiteralComment: Missing frozen string literal comment.
#Kernel.puts("hello world")

#hello.rb:1:13: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
#Kernel.puts("hello world")
#            ^^^^^^^^^^^^^
#hello.rb:1:27: C: Layout/TrailingEmptyLines: Final newline missing.
#Kernel.puts("hello world")
                          
#1 file inspected, 3 offenses detected
#
#
#output BREAKDOWN:

#the first tells you how many files were inspected.

#the C stands for Convention, which means a convention was 
#broken. Other possible offenses are W (warning), E (error), 
#and F (fatal error).

#the list of offenses appears next; we have three, so you can 
#see they appear sequentially in the order in which the 
#offending code occurs in the inspected file. The first part 
#of the offense tells you where the offense occurred: the file 
#name, the line number, and the column number. Then C again 
#for convention, then the offense message. After that, it even 
#shows you the actual piece of code where the offense occurred. 

#To find out which cop complained, we can do this.

#CLI:
# rubocop hello.rb --format offenses
#
#output:

#1  Style/FrozenStringLiteralComment
#1  Style/StringLiterals
#--
#2  Total

#BREAKDOWN
#This output shows us total offenses per cop, and the total 
#offenses in our code. It also shows us that the 
#FrozenStringLiteralComment and StringLiterals cops in the 
#Style department were the cops that complained about our 
#hello.rb.