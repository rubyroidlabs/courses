
# Ruby sites

## Websites basics & Working with sockets

```
require 'socket'

server = TCPServer.open(3000)

loop do
  client = server.accept
  client.puts(Time.now.ctime)
  client.close
end
```

* credits: https://practicingruby.com/articles/implementing-an-http-file-server


## First website

```
require 'socket'

server = TCPServer.open(3000)

loop do
  # Wait until a client connects, then return a TCPSocket
  # that can be used in a similar fashion to other Ruby
  # I/O objects. (In fact, TCPSocket is a subclass of IO.)
  socket = server.accept

  # Read the first line of the request (the Request-Line)
  request = socket.gets

  # Log the request to the console for debugging
  STDERR.puts request

  response = "#{Time.now.ctime}\n"

  # We need to include the Content-Type and Content-Length headers
  # to let the client know the size and type of data
  # contained in the response. Note that HTTP is whitespace
  # sensitive, and expects each header line to end with CRLF (i.e. "\r\n")
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  # Print a blank line to separate the header from the response body,
  # as required by the protocol.
  socket.print "\r\n"

  # Print the actual response body, which is just "Hello World!\n"
  socket.print response

  # Close the socket, terminating the connection
  socket.close
end
```

```
ruby -run -e httpd . -p 9090
```


## Rack 
```
require 'rack'

app = Proc.new do |env|
    ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
end

Rack::Handler::WEBrick.run app

```

```
run Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, ['get rack\'d']] }
```

```
run App.new
```

```
require 'rack'
require 'rack/lobster'
run Rack::Lobster.new

```
### Rack middleware

```
class Cowsay

  def call(env)
    phrase = CGI.parse(env["QUERY_STRING"])["say"].first
    cow_phrase = `cowsay #{phrase}`

    ['200', {'Content-Type' => 'text/html'}, [cow_phrase]]
  end

end
```

```
def call(env)
  req = Rack::Request.new(env)
  req.request_method #=> GET, POST, PUT, etc.
  req.get?           # is this a GET requestion
  req.path_info      # the path this request came in on
  req.session        # access to the session object, if using the
  # Rack::Session middleware
  req.params         # a hash of merged GET and POST params, useful for
  # pulling values out of a query string
 
  # ... and many more
end
```

```
https://github.com/rack/rack-contrib

```

```
http://ruby.about.com/od/rack/a/List-Of-Rack-Middleware.htm
```

### Rack servers
