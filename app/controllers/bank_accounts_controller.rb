class BankAccountsController < ApplicationController

  def index
    @accounts = BankAccount.includes(:client)

    if params[:query].present?
      q = params[:query]
      @accounts = @accounts.joins(:client)
        .where("bank_accounts.id LIKE '%#{q}%' OR
          clients.full_name LIKE '%#{q}%' OR
          bank_accounts.account_type LIKE '%#{q}%' OR
          bank_accounts.currency LIKE '%#{q}%'")
    end

    if request.xhr?
      render partial: "table", locals: {accounts: @accounts}, status: 200
    end
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
    @accounts = BankAccount.includes(:client)
    render partial: "table", locals: {accounts: @accounts}, status: 200
  end

  protected

    def account_params
      params.require(:bank_account).permit!
    end
end
