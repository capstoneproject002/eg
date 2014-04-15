class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    MessageMailer.send_message(message.id).deliver!
  end
end
