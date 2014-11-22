class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.integer :room_id
      t.integer :price
      t.integer :persons

      t.timestamps null: false
      t.index [:start_date, :end_date]
    end
  end
end
