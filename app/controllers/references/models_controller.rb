class References::ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: ModelDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @model = Model.new
  end

  def edit
  end

  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to references_models_url, notice: 'Модель успешно создана.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to references_models_url, notice: 'Модель успешно изменена.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to references_models_url, notice: 'Модель успешно удалена.' }
      format.json { head :no_content }
    end
  end
  
  def select_models_dialog
    @models = Model.search(params[:search]).ordered_by_title.page(params[:page] || 1).per(10)
    session[:models_page] = params[:page]
    session[:models_search] = params[:search] 
    render layout: false
  end  

  private
    def set_model
      @model = Model.find(params[:id])
    end

    def model_params
      params.require(:model).permit(:title, :brand_id)
    end
end
