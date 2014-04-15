# encoding: UTF-8
class TeacherMailer < ActionMailer::Base
  default from: 'noreply@agile-thicket-8353.herokuapp.com'
  def send_login_information(teacher_id, password)
    @teacher = Teacher.find(teacher_id)
    @password = password
    mail(to: @teacher.email, subject: 'Öğrenci Bilgi Sistemi Giriş Bilgileriniz')
  end
end
