class References::StockLocationsController < ApplicationController
  before_action :set_stock_location, only: [:show, :edit, :update, :destroy]

  def index
    @stock_locations = StockLocation.ordered_by_name.page params[:page]
  end

  def show
  end

  def new
    @stock_location = StockLocation.new
  end

  def edit
  end

  def create
    @stock_location = StockLocation.new(stock_location_params)

    respond_to do |format|
      if @stock_location.save
        format.html { redirect_to references_stock_locations_url, notice: 'Склад был успешно создан.' }
        format.json { render :show, status: :created, location: @stock_location }
      else
        format.html { render :new }
        format.json { render json: @stock_location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stock_location.update(stock_location_params)
        format.html { redirect_to references_stock_locations_url, notice: 'Склад был успешно изменён.' }
        format.json { render :show, status: :ok, location: @stock_location }
      else
        format.html { render :edit }
        format.json { render json: @stock_location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock_location.destroy
    respond_to do |format|
      format.html { redirect_to references_stock_locations_url, notice: 'Склад был успешно удалён.' }
      format.json { head :no_content }
    end
  end

  private
    def set_stock_location
      @stock_location = StockLocation.find(params[:id])
    end

    def stock_location_params
      params.require(:stock_location).permit(:name, :user_id, :active, :is_engineer_stock)
    end
end
