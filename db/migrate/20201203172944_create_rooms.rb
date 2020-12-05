class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :number
      t.string :room_type
      t.integer :price
      t.boolean :is_booked, default: false

      t.timestamps
    end
  end
end
