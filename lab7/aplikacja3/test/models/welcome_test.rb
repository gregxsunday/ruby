####################################################
# Autor: Stanisław Polak, wersja z dnia 24 maja 2018
####################################################
require 'test_helper'

class WelcomeTest < ActiveSupport::TestCase
  test 'Nie zapisuj pustego powitania' do
    welcome = Welcome.new
    assert_not welcome.save, "Zapisano rekord z pustą wartością pola 'message'"
  end
end
