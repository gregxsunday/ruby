####################################################
# Autor: Stanisław Polak, wersja z dnia 24 maja 2018
####################################################
require 'test_helper'
require 'pp' if RUBY_VERSION < '2.5'

class MessageFlowsTest < ActionDispatch::IntegrationTest
 test 'Przegladaj witryne' do

   #Wyświetlanie, początkowej, zawartości BD
   welcomes = Welcome.all
   if welcomes.size != 3
     puts "[32mAktualna zawartość tabeli 'welcomes' testowej bazy danych [0m"
     pp welcomes
   end

    # Sprawdzanie poprawności danych testowych pochodzących z osprzętu
    assert_equal 3, welcomes.size
    assert_equal Welcome.first.message, 'Witaj Świecie 2'
    assert_equal Welcome.last.message, 'Witaj Świecie 1'

    # Testowanie działania strony głównej
    get welcomes_path
    assert_response :success

    # Testowanie możliwości wyświetlenia pojedynczego rekordu
    get welcome_path(id: 2)
    assert_select 'body', 'Witaj Świecie 3'

    # Testowanie możliwości tworzenia wpisów
    get new_welcome_path
    assert_response :success
    post welcomes_path, params: { welcome: { message: 'Witaj Świecie 4' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_includes response.body, 'Witaj Świecie 4'
  end
end
