class Documents::OrdersController < ApplicationController
  before_action :set_order, only: %w(show edit update destroy)

  def index
    respond_to do |format|
      format.html { @orders_total_number = Order.count } 
      format.json { render text: Order.search(params[:search]).
                                 ordered.
                                 page(params[:page]).
                                 to_json(methods: [:brand_title, :model_title, 
                                                   :client_name, :type, 
                                                   :equipment_type_title, 
                                                   :working_state, 
                                                   :working_state_color
                                                  ]
                                        )
                  }
      format.js {render layout: false}
    end
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to documents_orders_url, notice: 'Заказ наряд успешно создан.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to documents_orders_url, notice: 'Заказ наряд успешно изменён.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to documents_orders_url, notice: 'Заказ наряд успешно удалён.' }
      format.json { head :no_content }
    end
  end
  
  
  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:client_id, :user_id, :stock_location_id, 
                                    :job_type, :model_id, :imei, :serial_number,
                                    :defect, :completeness, :appearance, :description)
    end
end
