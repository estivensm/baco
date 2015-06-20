class TransactionsController < ApplicationController
  def index
    @bank_account = BankAccount.find(params[:bank_account_id])
    @transactions = @bank_account.transactions.order(created_at: :desc)
  end

  def new
    @label = params[:label]
    @bank_account = BankAccount.find(params[:bank_account_id])
    @transaction = @bank_account.transactions.build(label: @label)
  end

  def create
    @bank_account = BankAccount.find(params[:bank_account_id])
    @transaction = @bank_account.transactions.build(transaction_params)

    if @transaction.save
      redirect_to @bank_account
    else
      @label = @transaction.label
      render :new
    end
  end

  def destroy
    #DELETE /bank_accounts/:bank_account_id/transactions/:id
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to bank_account_transactions_path(@transaction.bank_account)
  end

  private
    def transaction_params
      params.require(:transaction).permit(:responsible, :amount, :label)
    end
end
