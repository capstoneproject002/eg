class Attachment < ActiveRecord::Base
  belongs_to :user
  belongs_to :class_room

  has_attached_file :file

  validates_presence_of :title, :class_room, :file
end
