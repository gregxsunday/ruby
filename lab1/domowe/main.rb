def convert(arg)
  # original = arg
  begin
    if arg.class == String
      if arg.index('i') != nil
        arg = Complex(arg)
      elsif arg.index('/') != nil
        arg = Rational(arg)
      elsif arg.index('.') != nil
        arg = Float(arg)
      else
        arg = Integer(arg)
      end
    end
  rescue ArgumentError
    raise ArgumentError, "\e[4m#{__FILE__}:#{__LINE__}\e[0m: \e[31mArgument funkcji 'sum()' nie jest ani liczbą, ani napisem\e[0m"
  end
  # if arg == 0 and original != "0"
  #   warn("\e[4m#{__FILE__}:#{__LINE__}\e[0m: \e[31mArgument funkcji 'sum()' nie jest ani liczbą, ani napisem\e[0m")
  # end
  return arg
end

# Calculates 'arg1' + 'arg2'.
#
# @param arg1 [Integer, Float, String, Rational, Complex]
#        the first component of the sum
# @param arg2 [Integer, Float, String, Rational, Complex]
#        the second component of the sum
# @return [Integer, Float, Rational, Complex]
#        sum of two numbers
def sum(arg1, arg2)
  arg1 = convert(arg1)
  arg2 = convert(arg2)

  begin
  res = arg1 + arg2
  rescue TypeError
    raise TypeError, "\e[4m#{__FILE__}:#{__LINE__}\e[0m: \e[31mArgument funkcji 'sum()' nie jest ani liczbą, ani napisem\e[0m"
  end
  return res
end

if __FILE__ == $0
  print('suma = ' + sum(1, 2).to_s())
end

