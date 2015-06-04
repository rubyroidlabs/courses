require 'active_record'


# connect to MySQL with authentication
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     'localhost',
  username: 'root',
  password: '',
  database: 'testone'
)


# show diff between up/down and change
class AddSystemSettings < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :name, null: false, default: 'yury' # try to create user withou name
      t.string  :address, null: false # try to create user withou address
      t.integer :age
    end

    remove_column :people, :name, :string, null: false

    user.each.add 1year
  end

  # def up
  #   create_table :people do |t|
  #     t.string  :name, null: false, default: 'yury'
  #     t.string  :address, null: false
  #     t.integer :age
  #   end

  #   add_column :people, :sex, :string
  # end

  # def down
  #   drop_table :people
  # end
end

AddSystemSettings.new.up
