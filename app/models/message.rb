class Message < ActiveRecord::Base
  validates_presence_of :title, :content, :receiver

  extend Enumerize

  enumerize :receiver, in: [:teacher, :student, :both]
end
