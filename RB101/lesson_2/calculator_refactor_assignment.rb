require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
#greet
#ask for name(only the first time)
#ask for valid_number(twice)
#ask for the math operation(+, - , /, *)
#annouce the operation being done
#show result
#ask if if they would like to do it again
#goodbye messsage

def valid_number(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def valid_string(str)
  str.to_i.to_s == '0'
end

def operation(operator)
  case operator
  when '1'
    translation(MESSAGES["adding2"], MESSAGES["adding"])
  when '2'
    translation(MESSAGES["subtracting2"], MESSAGES["subtracting"])
  when '3'
    translation(MESSAGES["multiplying2"], MESSAGES["multiplying"])
  when '4'
    translation(MESSAGES["dividing2"], MESSAGES["dividing"])
  end
end

def translation(input1, input2)
  if translator(GETS_LANG)
    prompt(input1)
  else
    prompt(input2)
  end
end


def translator(gets_lang)
  gets_lang == '2'
end

def prompt(message)
  prompt = "=> #{message}"
 puts prompt
 prompt
end

#ask english or spanish
prompt("Press 1) for  English, 2) for Spanish")
loop do #lang loop
  case GETS_LANG = gets.chomp
    when "1"
      prompt(MESSAGES["welcome"])
      break
    when "2"
      prompt(MESSAGES["welcome2"])
      break
    else
      prompt(MESSAGES["lang_error"])
  end
end

gets_name = nil
loop do
 gets_name = gets.chomp
  unless valid_string(gets_name) 
  translation(MESSAGES["name_error2"], MESSAGES["name_error"])
  else
  break
  end
end
  
#
   translation("Saludos, #{gets_name}", "Greetings, #{gets_name}")
loop do
  number1 = nil
  
  loop do 
    translation(MESSAGES["first_input2"], MESSAGES["first_input"])
    number1 = gets.chomp
    break if valid_number(number1)
    translation(MESSAGES["num_error2"], MESSAGES["num_error"])
  end
  
  number2 = nil
  loop do 
    translation(MESSAGES["second_input2"], MESSAGES["second_input"]) 
    number2 = gets.chomp
    break if valid_number(number2)
    translation(MESSAGES["num_error2"], MESSAGES["num_error"])
  end
  
  
  if translator(GETS_LANG) 
    operator_prompt = <<-MSG  
        ¿Qué ópera te gustaría interpretar? 
        1) añadir 
        2) restar 
        3) multiplicar 
        4) dividir
      MSG
  else
     operator_prompt = <<-MSG
     What operaton would you like to perform? 
       1) add 
       2) subtract 
       3) multiply 
       4) divide
     MSG
  end
  
  prompt(operator_prompt)
  
  operator = ''
    loop do 
      operator = gets.chomp
      if %w(1 2 3 4).include?(operator)
        break
      else
       translation(MESSAGES["operation_error2"], MESSAGES["operation_error"])
      end
  end
  
  operation(operator)
  
  result =  case operator
              when '1'
                number1.to_i + number2.to_i
              when '2'
                number1.to_i - number2.to_i
              when '3'
                number1.to_i * number2.to_i
              when '4'
                number1.to_f / number2.to_f
            end
  
  translation("El resultado fue #{result}", "The result was #{result}")
  
  translation(MESSAGES["replay2"], MESSAGES["replay"])
  
    again = gets.chomp
    if again != 'y'.downcase
      translation(MESSAGES["goodbye2"], MESSAGES["goodbye"])  
   break
    else
    end
end