# encoding: UTF-8
class UserMailer < ActionMailer::Base
  def send_login_information(user_id, password)
    @user = User.find(user_id)
    @password = password
    mail(to: @user.email, subject: 'Öğrenci Bilgi Sistemi Giriş Bilgileriniz')
  end
end
