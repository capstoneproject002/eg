# encoding: UTF-8
class UserMailer < ActionMailer::Base
  default from: 'noreply@agile-thicket-8353.herokuapp.com'
  def send_login_information(user_id, password)
    @user = User.find(user_id)
    @password = password
    mail(to: @user.email, subject: 'Öğrenci Bilgi Sistemi Giriş Bilgileriniz')
  end
end
