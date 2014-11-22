class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :type
      t.string :name
      t.integer :price, default: 0

      t.timestamps null: false
      t.index :type
    end
  end
end
