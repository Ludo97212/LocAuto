class AddEngineToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :engine, :string
  end
end
