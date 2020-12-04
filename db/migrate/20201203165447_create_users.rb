class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.integer :age
      t.string :aadhar_no
      t.string :type
      t.string :username
      t.string :password 	

      t.timestamps
    end
  end
end
