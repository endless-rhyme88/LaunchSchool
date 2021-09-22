require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

#If you go to the YAML documentation 
#(it's part of the Standard Library API), you will find 
#a page that is almost completely devoid of useful 
#information. There's not a single method described, 
#and only 3 ridiculously trivial examples. 
#There is no Parent class defined, there are no 
#Included Modules, and the YAML-related links on 
#the left-side are of no help.

#The key here is the reference to Psych. If you go back 
#to the Standard Library API page and click on psych, 
#you see a long list of Psych-related classes. 
#Unfortunately, that long list makes a quest for a 
#method named ::load_file somewhat daunting.