require 'pry'

class Cowsay

  def call(env)
    phrase = CGI.parse(env["QUERY_STRING"])["say"].first
    cow_phrase = `cowsay #{phrase}`

    ['200', {'Content-Type' => 'text/html'}, [cow_phrase]]
  end

end
