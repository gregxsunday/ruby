require "SalesSystem/version"

module SalesSystem
  class Error < StandardError; end

  class Grocery
    def initialize()
      @clients = []
    end

    def << (client)
      @clients.push(client)
    end

    def length()
      return @clients.length
    end

    def [] (key)
      @clients.each do |client|
        if (client.first_name + ' ' + client.last_name).to_sym == key
          return client
        end
      end
    end

    def inspect
      res = ""
      @clients.each do |client|
        res += "[\"#{client.first_name} #{client.last_name}\"], "
      end
      return res.chomp(", ")
    end
  end

  class Client
    def initialize(name, surname)
      @first_name = name
      @last_name = surname
      @id = rand(1000)
      @discount = 0
      @products = []
    end

    def first_name
      return @first_name
    end

    def first_name=(name)
      @first_name = name
    end

    def last_name
      return @last_name
    end

    def last_name=(name)
      @last_name = name
    end

    def id
      return @id
    end

    def add_product(product)
      @products.push(product)
    end

    def products
      return @products
    end

    def discount()
      return @products.length >= 5 ? 10 : 0
    end

    def has_discount?()
      return discount > 0 ? true : false
    end

    def sum()
      return @products.length * 10 * (100 - discount) / 100
    end

    def to_s
      res = ''
      res +=@first_name + " " + @last_name + "\n\n" + "Rabat=#{discount}%\n\n"
      @products.each do |prod|
        res += prod + "\n"
      end
      res += "\nSuma=#{sum}"
      return res
    end
  end

  class Grocery

  end
end
