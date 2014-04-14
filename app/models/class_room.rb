class ClassRoom < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :semester
  has_and_belongs_to_many :users

  validates_presence_of :teacher, :semester, :teacher_id, :semester_id, :name
  validates_uniqueness_of :teacher_id, scope: [:semester_id]
end
