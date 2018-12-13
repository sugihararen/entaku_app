class AddColumnReservationTimes < ActiveRecord::Migration[5.2]

  def up
    remove_column :reservation_times, :start_time, :time
    remove_column :reservation_times, :end_time, :time
    add_column :reservation_times, :start_time, :datetime ,comment: "開始時刻"
    add_column :reservation_times, :end_time, :datetime,commnet: "終了時刻"
  end
  def down
    remove_column :reservation_times, :start_time, :datetime
    remove_column :reservation_times, :end_time, :datetime
    add_column :reservation_times, :start_time, :time ,comment: "開始時刻"
    add_column :reservation_times, :end_time, :time,commnet: "終了時刻"
  end
end
