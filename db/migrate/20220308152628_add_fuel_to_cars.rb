class AddFuelToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :fuel, :string
  end
end
