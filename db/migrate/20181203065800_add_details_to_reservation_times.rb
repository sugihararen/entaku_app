class AddDetailsToReservationTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :reservation_times, :reservation_theme, :string, comment: "予約テーマ"     
  end
end
