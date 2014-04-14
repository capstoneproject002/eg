class Semester < ActiveRecord::Base
  extend Enumerize

  enumerize :semester, in: {first: 1, second: 2, summer: 3}

  validates_presence_of :semester, :name, :year

  validates_uniqueness_of :semester, scope: [:year]

  before_validation :set_name

  def set_name
    self.name = "#{self.year} - #{self.semester.text}"
  end
end
