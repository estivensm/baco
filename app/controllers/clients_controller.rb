class ClientsController < ApplicationController
  before_action :get_client, only: [:show, :edit, :destroy]

  def index
    @clients = Client.order(:name)
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
    @client.destroy
  end

  private
    def get_client
      @client = Client.find(params[:id])
    end
end
