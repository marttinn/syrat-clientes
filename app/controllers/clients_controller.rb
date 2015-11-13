class ClientsController < ApplicationController


  Mail.defaults do
    delivery_method :smtp, {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :domain => 'heroku.com',
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  end

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

  def mail
    @client = Client.find(params[:id])
    client_here = Client.find(params[:id])

    if !client_here.blank?
      Mail.deliver do
        to client_here.email
        from 'no-reply@syrat.mx'
        subject 'Avance en tu reparación'
        body "Buen día  #{client_here.name}! Tú código de avances es: #{client_here.unique_repair_id} \b Sigue el proceso de tu reparación aquí: https://pacific-shore-4043.herokuapp.com/clients/search?id_query=#{client_here.unique_repair_id} "
      end
    else
    end


  end

  private

    def params_required
      params.require(:client).permit(:name, :url, :car_model, :car_year, :email, :telephone, :serial, :folio)
    end
end
