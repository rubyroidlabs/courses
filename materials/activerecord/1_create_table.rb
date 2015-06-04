require 'active_record'

# log all the stuff to the screen
ActiveRecord::Base.logger = Logger.new STDOUT

# connect to MySQL with authentication
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     'localhost',
  username: 'root',
  password: '',
  database: 'testone'
)


# add migration
class AddSystemSettings < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string  :name
      t.string  :address
      t.integer :age
    end

    add_column :users, :sex, :string
  end

  def down
    drop_table :users
  end
end

AddSystemSettings.new.up
