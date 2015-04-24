class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
