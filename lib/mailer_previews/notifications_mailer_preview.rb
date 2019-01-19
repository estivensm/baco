class NotificationsMailerPreview < ActionMailer::Preview
  def welcome
    NotificationsMailer.welcome(User.last)
  end

  def deposito
    NotificationsMailer.deposito(User.last, Transaction.depositos.last)
  end
end
