class WelcomesController < ApplicationController
  def index
    ######################
    # Poprzednia zawartość
    ######################
    # ...
    ###############################
    # Należy dopisać to, co poniżej
    ###############################
    print "\e[32m",'*' * 80, "\e[0m\n"
    puts 'Obiekt "params" zawiera:'
    Pry::ColorPrinter.pp(params)
    print "\e[32m",'*' * 80, "\e[0m\n"
  end
end