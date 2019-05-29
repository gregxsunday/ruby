require 'set'

def word_lenghts(inp)
  res = SortedSet.new
  inp.split(' ').each do |word|
    res.add(word.length)
  end
  return res
end

def how_often_certain_length(inp, len)
  res = 0
  inp.split(' ').each do |word|
    res += 1 if word.length == len
  end
  return res
end

def how_often(inp, lengths)
  res = Hash.new
  lengths.each do |len|
    res[len] = how_often_certain_length(inp, len)
  end
  return res
end

if __FILE__ == $0
  # zad1.1
  # user_input = gets(nil)

  # zad1.3
  user_input = <<-INP
qq ffaf
1 1
  INP
  puts user_input

  lengths = word_lenghts(user_input)
  puts "Długość napisu\tKrotność wystąpienia"
  spaces = " " * "Długość napisu\t".length
  res = how_often(user_input, lengths)
  res.each do |len, freq|
    puts "#{len}#{spaces}#{freq}"
  end
end