class References::WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: WarehouseDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @warehouse = Warehouse.new
  end

  def edit
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    respond_to do |format|
      if @warehouse.save
        format.html { redirect_to references_warehouses_url, notice: 'Склад был успешно создан.' }
        format.json { render :show, status: :created, location: @warehouse }
      else
        format.html { render :new }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @warehouse.update(warehouse_params)
        format.html { redirect_to references_warehouses_url, notice: 'Склад был успешно изменён.' }
        format.json { render :show, status: :ok, location: @warehouse }
      else
        format.html { render :edit }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @warehouse.destroy
    respond_to do |format|
      format.html { redirect_to references_warehouses_url, notice: 'Склад был успешно удалён.' }
      format.json { head :no_content }
    end
  end

  private
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def warehouse_params
      params.require(:warehouse).permit(:title, :user_id)
    end
end
