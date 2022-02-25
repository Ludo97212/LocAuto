class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year_of_production
      t.text :address
      t.float :price_per_day
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
