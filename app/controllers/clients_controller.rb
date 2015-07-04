class ClientsController < ApplicationController
  before_action :get_client, only: [:show, :edit, :destroy, :update, :accounts, :hackeo]

  def index
    @clients = Client.order(:full_name)
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  def accounts
    @accounts = @client.bank_accounts
  end

  def hackeo
    @accounts = @client.bank_accounts
  end

  private
    def get_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:full_name, :birth_at, :email, :phone, bank_accounts_attributes: [:id, :balance])
    end
end
