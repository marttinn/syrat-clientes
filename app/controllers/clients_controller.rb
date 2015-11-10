class ClientsController < ApplicationController

  def new
  end

  def search
    @client = Client.find_by unique_repair_id: params[:id_query]

  end

  def create
    @client = Client.create(params_required)
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def index
    @clients = Client.all
  end

  private

    def params_required
      params.require(:client).permit(:name, :url, :car_model, :car_year, :email, :telephone, :serial)
    end
end
