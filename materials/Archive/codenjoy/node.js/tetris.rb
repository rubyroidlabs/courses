require 'rack'

my_lambda = lambda { |env| [200, {"Content-Type" => "text/plain"}, ["left=0, right=0, rotate=0, drop"]] }
Rack::Handler::WEBrick.run my_lambda, Port: 8888, Host: '0.0.0.0'
