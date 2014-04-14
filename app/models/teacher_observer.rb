class TeacherObserver < ActiveRecord::Observer
  def after_create(teacher)
    TeacherMailer.send_login_information(teacher.id, teacher.password).deliver!
  end
end
