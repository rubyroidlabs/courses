class App
  def call(env)
    ['200', {'Content-Type' => 'text/html'}, ['get rack\'d']]
  end
end
