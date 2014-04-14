class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :name
      t.string :year
      t.integer :semester

      t.timestamps
    end
  end
end
