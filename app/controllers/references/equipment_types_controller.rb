class References::EquipmentTypesController < ApplicationController
  before_action :set_equipment_type, only: %w(show edit update destroy)

  def index
    @equipment_types = EquipmentType.ordered_by_title.page params[:page]
  end

  def show
  end

  def new
    @equipment_type = EquipmentType.new
  end

  def edit
  end

  def create
    @equipment_type = EquipmentType.new(equipment_type_params)

    if @equipment_type.save
      redirect_to references_equipment_types_url, notice: 'Тип оборудования успешно создан.' 
    else
      render :new 
    end
  end

  def update
    if @equipment_type.update(equipment_type_params)
      redirect_to references_equipment_types_url, notice: 'Тип оборудования успешно изменен.'
    else
      render :edit
    end
  end

  def destroy
    @equipment_type.destroy
    redirect_to references_equipment_type_url, notice: 'Тип оборудования успешно удален.'
  end
  

  private
    def set_equipment_type
      @equipment_type = EquipmentType.find(params[:id])
    end

    def equipment_type_params
      params.require(:equipment_type).permit(:title)
    end
end
