class BankAccountsController < ApplicationController

  def index
    @accounts = BankAccount.order(created_at: :desc)
  end

  def show
    @account = BankAccount.find(params[:id])
  end

  def new
    @account = BankAccount.new
  end

  def create
    @account = BankAccount.new(account_params)

    if @account.save
      redirect_to @account
    else
      render :new
    end
  end

  def rates
    BankAccount.generar_intereses
    redirect_to bank_accounts_path
  end

  protected

    def account_params
      params.require(:bank_account).permit!
    end
end
