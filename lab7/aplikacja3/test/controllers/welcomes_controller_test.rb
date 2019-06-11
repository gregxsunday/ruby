####################################################
# Autor: Stanisław Polak, wersja z dnia 24 maja 2018
####################################################
require 'test_helper'

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  test 'Metoda index' do
    get welcomes_path
    assert_includes response.body, 'Witaj Świecie'
  end
end
