require 'active_record'
require 'ffaker'
require 'pry'


# connect to MySQL with authentication
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     'localhost',
  username: 'root',
  password: '',
  database: 'testone'
)

class User < ActiveRecord::Base
  has_many :cars, dependent: :destroy
end

class Car < ActiveRecord::Base
  belongs_to :user
end

100.times do
  user = User.create name: FFaker::Name.name, age: rand(100)

  10.times do
    user.cars.create tag: 'asdfs', color: ['red', 'green', 'blue'].sample
  end
end
