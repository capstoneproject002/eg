class CreateClassRoomsUsers < ActiveRecord::Migration
  def change
    create_table :class_rooms_users do |t|
      t.references :user, index: true
      t.references :class_room, index: true
      t.integer :gpa
      t.integer :score
      t.integer :attendance

      t.timestamps
    end
  end
end
