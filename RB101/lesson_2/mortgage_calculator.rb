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
  input.to_i.to_s == input || input.to_f.to_s == input
end

def validate_interest_rate(interest)
  if interest.to_i.to_s == interest || interest.to_f.to_s == interest
    (interest.to_f / 10) * 100
  end
end

def prompt(key)
  message = translation(key, LANGUAGE)
  puts ">> #{message}"
end

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

prompt("welcome")
prompt("seperator")

loop do
  loan_amount = nil
  prompt("get_loan_amount")
  loop do
    loan_amount = gets.chomp
    break if validate_loan_info(loan_amount)
    prompt("error")
  end

  prompt("get_loan_term_years")

  loan_years = nil

  loop do
    loan_years = gets.chomp
    break if validate_loan_info(loan_years)
    prompt("error")
  end

  prompt("get_loan_term_months")

  loan_months = nil
  loop do
    loan_months = gets.chomp
    break if validate_loan_info(loan_months)
    prompt("error")
  end

  prompt("the_interest_rate")

  interest_rate = nil
  loop do
    interest_rate = gets.chomp
    break if validate_interest_rate(interest_rate)
    prompt("error")
  end

  loan_term = convert_loan_term_to_months(loan_years.to_i, loan_months.to_i)

  monthly_interest_rate = monthly_interest(interest_rate.to_f)

  monthly_payment = loan_amount.to_i * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_term)))

  prompt("verification")

  verify = nil
  if language == '1'
    loop do
      puts <<-MSG
        Loan amount: #{loan_amount}
        Years: #{loan_years}
        Months: #{loan_months}
        Interest rate: #{interest_rate}
        
      1) Amount 2) Term 3) Interest Rate, or "Y" to conclude
      MSG

      verify = gets.chomp
      case verify
      when '1'
        puts "Old amount: #{loan_amount}"
        loop do
          loan_amount = gets.chomp
          break if validate_loan_info(loan_amount)
          prompt("error")
        end
      when '2'
        puts "Last input for Years: #{loan_years}"
        loop do
          loan_years = gets.chomp
          break if validate_loan_info(loan_years)
          prompt("error")
        end
        puts "Last input for Months: #{loan_months}"
        loop do
          loan_months = gets.chomp
          break if validate_loan_info(loan_months)
          prompt("error")
        end
      when '3'
        puts "Old Interest Rate: #{interest_rate} "
        loop do
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
        Monto del préstamo: #{loan_amount} 
        Años: #{loan_years} 
        Meses: #{loan_months} 
        Tasa de interés: #{interest_rate}
          
        1) Monto 2) Plazo 3) Tasa de interés, o "Y" para concluir
      MSG
      verify = gets.chomp
      case verify
      when '1'
        puts "Importe antiguo: #{loan_amount}"
        loop do
          loan_amount = gets.chomp
          break if validate_loan_info(loan_amount)
          prompt("error")
        end
      when '2'
        puts "Última entrada para años: #{loan_years}"
        loop do
          loan_years = gets.chomp
          break if validate_loan_info(loan_years)
          prompt("error")
        end
        puts "Última entrada para meses: #{loan_months}"
        loop do
          loan_months = gets.chomp
          break if validate_loan_info(loan_months)
          prompt("error")
        end
      when '3'
        puts "Tasa de interés anterior: #{interest_rate} "
        loop do
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

  if language == '1'
    puts <<-MSG
>> Your monthly billing totals to: 
        '$#{monthly_payment.floor(2)}' 
          
>> over the course of: 
        #{loan_years}yrs.  
        #{loan_months}mth.
    MSG
  elsif language == '2'
    puts <<-MSG
>> Su facturación mensual asciende a: 
        '$#{monthly_payment.floor(2)}' 
       
>> en el transcurso de: 
        #{loan_years}años. 
        #{loan_months}mth.
    MSG
  end
  prompt("replay")
  again = gets.chomp
  if again != 'y'.downcase
    prompt("goodbye")
    break
  end
end