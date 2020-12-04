class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :number
      t.string :room_type
      t.integer :price	
      t.string :status

      t.timestamps
    end
  end
end
