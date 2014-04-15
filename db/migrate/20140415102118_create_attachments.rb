class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :user, index: true
      t.references :class_room, index: true
      t.string :title
      t.attachment :file

      t.timestamps
    end
  end
end
