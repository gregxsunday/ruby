class WelcomesController < ApplicationController
  def index
    @ilosc = 3
    @komunikat = "komunikat"
    @tablica = [2, "napis"]
    @hash = {"a" => "b", "c" => "d"}
    puts @ilosc
    puts @komunikat
    puts @tablica
    puts @hash
    # console()
    # raise('err')
  end
end
