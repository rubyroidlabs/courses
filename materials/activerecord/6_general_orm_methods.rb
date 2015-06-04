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

class User < ActiveRecord::Base
  has_many :cars, dependent: :destroy

  validates :name, presence: true

  after_create :add_car, if: ->{ false }

  private

  def add_car
    cars.create color: 'purple'
  end
end

class Car < ActiveRecord::Base
  belongs_to :user

  default_scope { where(color: 'red') }
  scope :green, ->() { where(color: 'green') }

end

User.create name: 'yury'

binding.pry
