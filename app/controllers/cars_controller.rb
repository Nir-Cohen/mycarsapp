class CarsController < ActionController::API
  Rails.logger = Logger.new(STDOUT)
  logger = Rails.logger


  # GET /cars or /cars.json
  def index
    @cars = Car.all
    @drivers = Driver.all
    render json: { data: @cars , status: "OK"}
  end

  # GET /cars/1 or /cars/1.json
  def show
    @car = Car.find(params[:id])
    render json: { data: @car }
  end

  # GET /cars/new
  def new
    @car = Car.new
    @drivers = Driver.all
  end


  def newTest
    @car = Car.new
    render json: { data: 'refresh' }
  end

  # GET /cars/1/edit
  def edit
  end

  def searchByDriverId
    logger.info 'here'
    @parameter = params[:id]
    logger.info @parameter
    @results = Car.all.where("driver_id = :search", search: @parameter)  
    render json: @results
  end

  # POST /cars or /cars.json
  def create
    logger.info 'create'
    @car = Car.create(car_params)
    logger.info car_params
    if @car.save
      render json: @car, status: 201
  else
      render json: {errors: @car.errors}, status: 422
  end
   
  end






  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      logger.info params[:title]
      params.require(:car).permit(:title, :typeCar, :color,:driver_id)
    end
end
