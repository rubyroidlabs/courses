require 'pry'

class Looser
  def initialize(app)
    @app = app
  end

  def call(env)
    response, headers, body = @app.call(env)
    body = [body.first.sub('>', ', looser>')]
    [response, headers, body]
  end

end
