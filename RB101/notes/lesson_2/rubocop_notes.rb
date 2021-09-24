#Rubocop is a static code analyzer. This means that it 
#analyzes your code and offers advice about its style format as 
#well as possible logical errors. Rubocop itself is a modular 
#framework using a pluggable architecture to insert enforcement 
#rules. In Rubocop parlance, these rules are called cops. 
#Cops are further grouped into departments

#if you find a rubocops criteria to be too strict
#you can create a .rubocop.yml file and modify which cop you
#you wish to change

#Rubocop will look for a .rubocop.yml file in the directory 
#it's executed in and apply the configuration settings.
# If it doesn't find a .rubocop.yml file in the current 
#directory, it will recursively look in each parent of the 
#current directory until either one is found or it runs out 
#of parent directories to search. If none is found, no 
#additional configuration settings will be applied and it 
#will use its default rules.