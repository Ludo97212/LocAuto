class ChangePricePerDayToCars < ActiveRecord::Migration[6.1]
  def change
    change_column :cars, :price_per_day, :integer
  end
end
