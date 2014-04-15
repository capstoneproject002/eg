# encoding: UTF-8
class MessageMailer < ActionMailer::Base
  default from: 'noreply@agile-thicket-8353.herokuapp.com'
  def send_message(message_id)
    @message = Message.find(message_id)
    if @message.receiver.student?
      bcc = User.pluck(:email)
    elsif @message.receiver.teacher?
      bcc = Teacher.pluck(:email)
    else
      bcc = (Teacher.pluck(:email) + User.pluck(:email))
    end
    mail(to: 'news@agile-thicket-8353.herokuapp.com', bcc: bcc.join(','),  subject: @message.title)
  end
end
