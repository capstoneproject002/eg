class Announcement < ActiveRecord::Base
  belongs_to :teacher
  validates_presence_of :title, :content
end
