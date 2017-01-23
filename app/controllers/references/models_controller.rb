class References::ModelsController < ApplicationController
  before_action :set_model, only: %w(show edit update destroy)

  def index
    respond_to do |format|
      format.html { @models_total_number = Model.count } 
      format.json { render text: Model.search(params[:search]).
                                 ordered_by_title.
                                 page(params[:page]).
                                 to_json(methods: [:brand_title, :equipment_type_title])
                  }
      format.js {render layout: false}
    end
  end

  def show
  end

  def new
    @model = Model.new
    respond_to do |format|
      format.html
      format.js {render layout: false}
    end  
  end

  def edit
  end

  def create
    @model = Model.new(model_params)
    
    respond_to do |format|
      if @model.save
        format.html { redirect_to references_models_url, notice: 'Модель успешно создана.' }
        format.js { render layout: false }
      else
        format.html { render :new }
        format.js { render layout: false }
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
