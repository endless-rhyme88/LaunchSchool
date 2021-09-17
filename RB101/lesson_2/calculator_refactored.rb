def prompt(message)
  Kernel.puts("=> #{message}") #allows for easier identifcation
end                           #for what we want the user to do   
                              #elimanates redudance of editing future prompts

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name")

name = ''
loop do
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt("Make sure to use a valid name")
  else
    break
  end
end

prompt("Hi #{name}")

loop do #main loop
  number1 = ''
    loop do
      prompt("What's the first number?")
      number1 = Kernel.gets().chomp()
      if valid_number?(number1)
        break
      else
        prompt("Hmm... that doesn't look like a valid number")
      end
    end
    
  number2 = ''
    loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
      if valid_number?(number2)
        break
      else
         prompt("Hmm... that doesn't look like a valid number")
      end
    end
    
    operator_prompt = <<-MSG #these letters can be anything as long as they match
      What operaton would you like to perform? 
        1) add 
        2) subtract 
        3) multiply 
        4) divide
    MSG
   
    prompt(operator_prompt)
   
   operator = ''
   loop do
     operator = Kernel.gets().chomp()
     
     if %(1 2 3 4).include?(operator)
       break
     else
       prompt("Must choose 1, 2, 3, 4")
     end
   end 
    
    prompt("#{operation_to_message(operator)} the two numbers...")
    
    result = case operator
             when '1'
               result = number1.to_i() + number2.to_i()
             when '2'
               result = number1.to_i() - number2.to_i()     
             when '3'                                       
                result = number1.to_i() * number2.to_i()  
             when '4'
               result = number1.to_f() / number2.to_f()
    end
  
  #case statements are better for multiple branching options such
  #as this than if statements as they look cleaner and less likely 
  #to bug out like when dealing with more than 3 options like this
  
    prompt("The result is #{result}")
    
    prompt("Do you want to perform another calculation? (Y to calculate again)")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye")