class AddKilometersToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :kilometers, :integer
  end
end
