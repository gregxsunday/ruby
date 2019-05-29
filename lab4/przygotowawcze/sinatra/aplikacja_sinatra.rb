require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  @welcome = 'Hello World' # Dane dla widoku
  @imie = params[:imie].upcase
  @nazwisko = params[:nazwisko].upcase
  erb :index, :layout  => :mylayout              # Renderuj widok 'index'
end
__END__
