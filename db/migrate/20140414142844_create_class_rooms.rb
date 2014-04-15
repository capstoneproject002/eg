class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.references :teacher, index: true
      t.references :semester, index: true
      t.string :name

      t.timestamps
    end
  end
end
