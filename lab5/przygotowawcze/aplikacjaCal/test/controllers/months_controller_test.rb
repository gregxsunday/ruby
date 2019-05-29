require 'test_helper'

class MonthsControllerTest < ActionDispatch::IntegrationTest
  test "months list" do
    get 'http://localhost:3000/months'
    assert_response :success

    assert_select 'ul', html: '<li><a href="/months/1">Styczeń</a></li>
  <li><a href="/months/2">Luty</a></li>
  <li><a href="/months/3">Marzec</a></li>
  <li><a href="/months/4">Kwiecień</a></li>
  <li><a href="/months/5">Maj</a></li>
  <li><a href="/months/6">Czerwiec</a></li>
  <li><a href="/months/7">Lipiec</a></li>
  <li><a href="/months/8">Sierpień</a></li>
  <li><a href="/months/9">Wrzesień</a></li>
  <li><a href="/months/10">Październik</a></li>
  <li><a href="/months/11">Listopad</a></li>
  <li><a href="/months/12">Grudzień</a></li>'
  end

  test 'show' do
    get 'http://localhost:3000/months/5'
    assert_response :success

    assert_select 'table', html: '<tr>
    <td>P</td>
    <td>W</td>
    <td>Ś</td>
    <td>C</td>
    <td>P</td>
    <td>S</td>
    <td>N</td>
  </tr>
    <tr>
        <td>
          
        </td>
        <td>
          
        </td>
        <td>
          1
        </td>
        <td>
          2
        </td>
        <td>
          3
        </td>
        <td>
          4
        </td>
        <td>
          5
        </td>
    </tr>
    <tr>
        <td>
          6
        </td>
        <td>
          7
        </td>
        <td>
          8
        </td>
        <td>
          9
        </td>
        <td>
          10
        </td>
        <td>
          11
        </td>
        <td>
          12
        </td>
    </tr>
    <tr>
        <td>
          13
        </td>
        <td>
          14
        </td>
        <td>
          15
        </td>
        <td>
          16
        </td>
        <td>
          17
        </td>
        <td>
          18
        </td>
        <td>
          19
        </td>
    </tr>
    <tr>
        <td>
          20
        </td>
        <td>
          21
        </td>
        <td>
          22
        </td>
        <td>
          23
        </td>
        <td>
          24
        </td>
        <td>
          25
        </td>
        <td>
          26
        </td>
    </tr>
    <tr>
        <td>
          27
        </td>
        <td>
          28
        </td>
        <td>
          29
        </td>
        <td>
          30
        </td>
        <td>
          31
        </td>
        <td>
          
        </td>
        <td>
          
        </td>
    </tr>
    <tr>
        <td>
          
        </td>
        <td>
          
        </td>
        <td>
          
        </td>
        <td>
          
        </td>
        <td>
          
        </td>
        <td>
          
        </td>
        <td>
          
        </td>
    </tr>'
  end

  test 'edit' do 
    put 'http://localhost:3000/months/year', params: {year: 2017}
    get 'http://localhost:3000/months'
    
    assert_select 'h1', html: '2017'
  end
end
