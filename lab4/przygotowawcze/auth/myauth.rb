class MyAuth
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    p request.params
    if request.params['imie'] != 'foo' or request.params['nazwisko'] != 'bar'
      response = Rack::Response.new
      response.status = 403
      response.write 'unauthorized'
      response.finish
    end
    @app.call(env)
  end
end
