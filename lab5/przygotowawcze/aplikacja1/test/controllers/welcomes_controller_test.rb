require 'test_helper'

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcomes_index_url
    assert_response :success
  end

  test "should show content of product page correctly" do
    # do a standard get of the product
    get welcomes_index_url
    assert_response :success
    #check that the content matches
    assert_select '#komunikat', html: 'komunikat: komunikat'
    assert_select '#komunikaty', html: 'komunikat
  komunikat
  komunikat'
    assert_select '#tablica', html: 'tablica:<br>
  tablica[0] = 2<br>
  tablica[1] = napis<br>'
    assert_select '#hashe', html: 'Hash:<br>
    @hash[a] = b<br>
    @hash[c] = d<br>'
  end
end
