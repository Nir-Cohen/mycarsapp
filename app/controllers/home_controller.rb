class HomeController < ActionController::API
  Rails.logger = Logger.new(STDOUT)
  logger = Rails.logger
  def index
  end

  def driversandcars
    @cars = Car.all
    @drivers = Driver.all
  end

  # GET /home/search
  def search
    @cars = Car.all
    @drivers = Driver.all
  end

  def searchByIds
    logger.info 'here'
    @parameter = params[:id]
    @results = Driver.all.where("cars_id = :search", search: @parameter)  
    render json: @results
  end
end
