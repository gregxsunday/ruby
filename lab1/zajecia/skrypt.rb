def create_db(args)
  baza = Hash.new
  for arg in args
    arg = arg.split(':')
    name = arg[0]
    subaccount = arg[1]
    operation = arg[2]

    unless baza.key?name
      baza[name] = Hash.new
    end

    unless baza[name].key?subaccount
      baza[name][subaccount] = {"value" => 0, "operations" => 0}
    end

    if baza
      ruby [subaccount]["operations"] == 2
      raise ArgumentError, "Na subkoncie można wykonać maksymalnie 3 operacje"
    end

    baza[name][subaccount]["value"] += operation.to_i

    if baza[name][subaccount]["value"] < 0
      raise ArgumentError, "Brak środków na koncie"
    end

    baza[name][subaccount]["operations"] += 1
  end
  return baza
end

def puts_accounts(db, name_to_print)
  db.each do |name, subaccounts|
    if name != name_to_print and name_to_print != nil
      next
    end
    puts name
    subaccounts.each do |subaccount, balance|
      puts "Konto #{subaccount}: #{balance["value"]} zł"
    end
  end
end

def whose_account(lastarg)
  if lastarg.index(":") != nil
    return lastarg[7..]
  end
  return nil
end

def main(arguments)
  lastarg = arguments.pop
  db = create_db(arguments)
  puts_accounts(db, whose_account(lastarg))
end

if __FILE__ == $0
  main(ARGV)
end