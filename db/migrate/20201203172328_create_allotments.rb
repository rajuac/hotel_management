class CreateAllotments < ActiveRecord::Migration[6.0]
  def change
    create_table :allotments do |t|
      t.string :user_id
      t.string :room_id
      t.datetime :checkin
      t.datetime :checkout
      t.string :status

      t.timestamps
    end
  end
end
