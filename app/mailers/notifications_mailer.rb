class NotificationsMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "Bienvenido a ROR bank")
  end

  def deposito(user, transaction)
    @user = user
    @account = transaction.bank_account
    @transaction = transaction
    to = "#{@account.client.full_name} <#{@account.client.email}>"
    mail(to: to,
      subject: "Deposito confirmado en tu cuenta!",
      reply_to: @user.email)
  end
end
