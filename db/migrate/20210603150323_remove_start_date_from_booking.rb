class RemoveStartDateFromBooking < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :start_date
  end
end
