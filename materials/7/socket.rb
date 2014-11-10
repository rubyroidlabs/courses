require 'socket'

server = TCPServer.open(3000)

loop do
  client = server.accept
  # client.puts(Time.now.ctime)
  client.puts <<-STR

    <html><body>#{Time.now.ctime}</body></html>
  STR
  client.close
end
