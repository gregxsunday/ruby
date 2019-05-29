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
  end
end


<h1>Welcomes#index</h1>
<p>Find me in app/views/welcomes/index.html.erb</p>
<p>komunikat: <%= @komunikat %></p>
<p>
<% (1..@ilosc).each do |i| %>
  <%= @komunikat %>
<% end %>
</p>
<p>tablica:<br>
<% for i in 0..(@tablica.length - 1) %>
  tablica[<%= i %>] = <%= @tablica[i]%><br>
<% end %>
</p>
<p>Hash:<br>
  <% @hash.each do |key, value| %>
    @hash[<%= key %>] = <%= value %><br>
  <% end %>

</p>