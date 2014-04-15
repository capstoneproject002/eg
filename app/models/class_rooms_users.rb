class ClassRoomsUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :class_room

  validates_numericality_of :gpa, :score, :attendance, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
end
