class ChangeAcceptedFromBookings < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :accepted, :boolean, default: false
  end
end
