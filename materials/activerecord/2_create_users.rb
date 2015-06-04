require 'active_record'
require 'pry'


# connect to MySQL with authentication
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     'localhost',
  username: 'root',
  password: '',
  database: 'testone'
)

ActiveRecord::Base.logger = Logger.new STDOUT

# AR class
class User < ActiveRecord::Base
end

# Simple class
class Person
end

User.create name: 'yury'
binding.pry

u = User.new
p = Person.new

u.methods.count #=> ~100
p.methods.count #=> 300+
