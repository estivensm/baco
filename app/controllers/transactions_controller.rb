class TransactionsController < ApplicationController
  def index
    @bank_account = BankAccount.find(params[:bank_account_id])
    @transactions = @bank_account.transactions.order(created_at: :desc)
  end

  def new
  end
end
