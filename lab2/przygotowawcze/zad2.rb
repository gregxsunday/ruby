def print_only_word(inp)
  return inp.match('[[:alpha:]]+')
end

def print_only_number(inp)
  return inp.match('[0-9]+')
end

if __FILE__ == $0
  loop do
    user_input = gets
    break unless user_input
    word = print_only_word(user_input)
    digit = print_only_number(user_input)
    if word != nil
      puts "  Wyraz: #{word}"
    end
    if digit != nil
      puts "  Liczba: #{digit}"
    end
  end
end