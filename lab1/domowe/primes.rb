def is_prime?(number)
  number = number.to_i
  return false if number <= 1
  (2..Math.sqrt(number).to_i).each do |i|
    return false if number % i == 0
  end
  return true
end

if __FILE__ == $0
  loop do
    puts "Podaj liczbe"
    input = gets
    begin
      in_int = Integer(input)
    rescue ArgumentError
      next
    end
    puts "#{in_int} #{if is_prime?in_int then 'jest liczba pierwsza' else 'nie jest liczba pierwsza' end}\n\n"
  end
end