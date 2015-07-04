class BankAccountsController < ApplicationController

  def index
    @accounts = BankAccount.includes(:client)
  end

  def show
    @account = BankAccount.find(params[:id])
  end

  def new
    @account = BankAccount.new
    @account.build_debit_card
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
