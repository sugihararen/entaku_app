class AddColumnReservationTime < ActiveRecord::Migration[5.2]
  def change
    add_column :reservation_times, :weekly, :string ,comment: "週ごとの予約"
  end
end
