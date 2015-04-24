class CreateBeerActions < ActiveRecord::Migration
  def change
    create_table :beer_actions do |t|
      t.string :action
      t.references :beer, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
