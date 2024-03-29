class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :content
      t.references :teacher, index: true

      t.timestamps
    end
  end
end
