class WelcomeController < ApplicationController

  def index
  end

  def locations
  end

  def repairs
  end

  def splash
  end

  def slider
    @car_name = params[:name]

    @files = Dir.glob(Rails.root+"app/assets/images/#{@car_name}/**")
    @count = @files.count

    # p "cuenta: #{@count}"

    render :layout => 'slider'

  end

end
