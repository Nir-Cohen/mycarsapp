class DriversController < ActionController::API
  Rails.logger = Logger.new(STDOUT)
  logger = Rails.logger

  # GET /drivers or /drivers.json
  def index
    @drivers = Driver.all
    render json: { data: @drivers }
  end

  # GET /drivers/1 or /drivers/1.json
  def show
    @driver = Driver.find(params[:id])
    render json: { data: @driver }
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers or /drivers.json
  def create
  
    @driver = Driver.create(driver_params)
    if @driver.save
      render json: @driver, status: 201
  else
      render json: {errors: @driver.errors}, status: 422
  end
   
  end

  # PATCH/PUT /drivers/1 or /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: "Driver was successfully updated." }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  def searchByCarId
    logger.info 'here'
    @parameter = params[:id]
    logger.info @parameter
    @results = Driver.all.where("cars_id = :search", search: @parameter)  
    render json: @results
  end




  # DELETE /drivers/1 or /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: "Driver was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def driver_params
      params.require(:driver).permit(:name, :email, :dateOfBirth, :cars_id)
    end
end
