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
    p @client.email
    if !client.blank?
      Mail.deliver do
        to @client.email
        from 'no-reply@syrat.mx'
        subject 'testing send mail'
        body 'Buen día  #{@client.name}! Sigue el proceso de tu reparación aquí: '
      end
    else
      p "Cliente no encontrado"
    end


  end

  private

    def params_required
      params.require(:client).permit(:name, :url, :car_model, :car_year, :email, :telephone, :serial, :folio)
    end
end
