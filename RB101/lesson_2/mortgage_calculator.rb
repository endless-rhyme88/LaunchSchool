require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator.yml')

def convert_loan_term_to_months(years, months)
  years_to_months = 12
  total_months = (years * years_to_months) + months
  total_months
end

def translation(message, lang='en')
  MESSAGES[lang][message]
end

def monthly_interest(interest_rate)
  conversion = interest_rate / 100
  monthly_interest = conversion / 12
  monthly_interest
end

def validate_loan_info(input)
  input.to_i >= 0 && input.to_i.to_s == input || input.to_f.to_s == input
end

def validate_interest_rate(input)
  if input.to_f > 0 && input.to_i.to_s == input || input.to_f.to_s == input
    (input.to_f / 10) * 100
  end
end

def prompt(key)
  message = translation(key, LANGUAGE)
  puts ">> #{message}"
end

def clear_prompt
  system "clear"
end

puts "Please select a Language"

puts "1) English or 2) Espanol?"
language = nil
loop do
  language = gets.chomp
  if language == '1'
    LANGUAGE = 'en'
    break
  elsif language == '2'
    LANGUAGE = 'es'
    break
  else
    puts "1 or 2"
  end
end

clear_prompt

prompt("welcome")
prompt("seperator")

loop do
  loan_amount = nil
  loop do
    prompt("get_loan_amount")
    loop do
      print '$'
      loan_amount = gets.chomp
      clear_prompt
      break if validate_loan_info(loan_amount)
      prompt("error")
    end
    if loan_amount == '0' || loan_amount == '0.0'
      prompt("error")
    else
      break
    end
  end

  clear_prompt

  prompt("get_loan_term_years")

  loan_years = nil
  loan_months = nil
  loop do
    loop do
      if language == '1'
        print "(Years):"
      else
        print "(Años):"
      end
      loan_years = gets.chomp
      break if validate_loan_info(loan_years)
      prompt("error")
    end
    loop do
      if language == '1'
        print "(Months):"
      else
        print "(Meses):"
      end
      loan_months = gets.chomp
      break if validate_loan_info(loan_months)
      prompt("error")
    end
    if loan_years == '0' && loan_months == '0'
      prompt("error")
    else
      break
    end
  end

  clear_prompt

  prompt("the_interest_rate")

  interest_rate = nil
  loop do
    print '%'
    interest_rate = gets.chomp
    break if validate_interest_rate(interest_rate)
    prompt("error")
  end

  clear_prompt

  prompt("verification")

  verify = nil
  if language == '1'
    loop do
      puts <<-MSG
        Loan amount: $#{loan_amount.to_f.floor(2)}
        Years: #{loan_years} yrs
        Months: #{loan_months} mth
        Interest rate: #{interest_rate}%
        
      1) Amount 2) Term 3) Interest Rate, or "Y" to conclude
      MSG
      print ":"
      verify = gets.chomp
      case verify
      when '1'
        clear_prompt
        puts "Old amount: $#{loan_amount}"
        loop do
          loop do
            print "New Amount: $"
            loan_amount = gets.chomp
            break if validate_loan_info(loan_amount)
            prompt("error")
          end
          if loan_amount == '0' || loan_amount == '0.0'
            prompt("error")
          else
            break
          end
        end
      when '2'
        clear_prompt
        puts "Last input for loan duration: #{loan_years}yrs, #{loan_months}mth"
        loop do
          loop do
            print "New input(Years):"
            loan_years = gets.chomp
            break if validate_loan_info(loan_years)
            prompt("error")
          end
          loop do
            print "New input(Months):"
            loan_months = gets.chomp
            break if validate_loan_info(loan_months)
            prompt("error")
          end
          if loan_years == '0' && loan_months == '0'
            prompt("error")
          else
            break
          end
        end
      when '3'
        clear_prompt
        puts "Old Interest Rate: %#{interest_rate} "
        loop do
          print "New Interest Rate: %"
          interest_rate = gets.chomp
          break if validate_interest_rate(interest_rate)
          prompt("error")
        end
      when 'y'.downcase
        break
      else
        prompt("verify_error")
      end
    end
  else
    loop do
      puts <<-MSG
        Monto del préstamo: $#{loan_amount.to_f.floor(2)} 
        Años: #{loan_years} años 
        Meses: #{loan_months} meses 
        Tasa de interés: #{interest_rate}%
          
        1) Monto 2) Plazo 3) Tasa de interés, o "Y" para concluir
      MSG
      print ":"
      verify = gets.chomp
      case verify
      when '1'
        clear_prompt
        puts "Importe antiguo: $#{loan_amount}"
        loop do
          loop do
            print 'Nuevo insumo para el monto del préstamo: $'
            loan_amount = gets.chomp
            break if validate_loan_info(loan_amount)
            prompt("error")
          end
          if loan_amount == '0' || loan_amount == '0.0'
            prompt("error")
          else
            break
          end
        end
      when '2'
        clear_prompt
        puts "plazo antiguo del préstamo #{loan_years}años, #{loan_months}meses"
        loop do
          loop do
            print "Nueva entrada(años):"
            loan_years = gets.chomp
            break if validate_loan_info(loan_years)
            prompt("error")
          end
          loop do
            print "Nueva entrada(meses):"
            loan_months = gets.chomp
            break if validate_loan_info(loan_months)
            prompt("error")
          end
          if loan_years == '0' && loan_months == '0'
            prompt("error")
          else
            break
          end
        end
      when '3'
        clear_prompt
        puts "Tasa de interés anterior: %#{interest_rate} "
        loop do
          print "Nuevo insumo para la tasa de interés: %"
          interest_rate = gets.chomp
          break if validate_interest_rate(interest_rate)
          prompt("error")
        end
      when 'y'.downcase
        break
      else
        prompt("verify_error")
      end
    end
  end

  loan_term = convert_loan_term_to_months(loan_years.to_i, loan_months.to_i)

  monthly_interest_rate = monthly_interest(interest_rate.to_f)

  monthly_payment = loan_amount.to_i * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_term)))

  clear_prompt

  if language == '1'
    puts <<-MSG
>> Your monthly billing totals to: 
        '$#{monthly_payment.floor(2)}' 
          
>> over the course of: 
        #{loan_years} yrs.  
        #{loan_months} mth.
    MSG
  elsif language == '2'
    clear_prompt
    puts <<-MSG
>> Su facturación mensual asciende a: 
        '$#{monthly_payment.floor(2)}' 
       
>> en el transcurso de: 
        #{loan_years} años. 
        #{loan_months} meses.
    MSG
  end

  prompt("replay")
  print ":"
  again = gets.chomp
  if again != 'y'.downcase
    clear_prompt
    prompt("goodbye")
    break
  end
end
