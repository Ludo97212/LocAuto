class AddSeatsToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :seats, :integer
  end
end
