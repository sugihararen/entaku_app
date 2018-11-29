class CreateReservationTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_times do |t|
      t.integer :user_id , comment: "ユーザーID"        
      t.date   :reservation_date, comment: "予約日"
      t.time   :start_time, comment: "使用開始時間"
      t.time   :end_time, comment: "使用終了時間"

      t.timestamps
    end
  end
end
