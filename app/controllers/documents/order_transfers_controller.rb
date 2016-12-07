class Documents::OrderTransfersController < ApplicationController
  before_action :set_order, only: %w(new create)

  def index
    respond_to do |format|
      format.html
      format.js {render layout: false}
    end 
  end

  def new
    @order_transfer = @order.transfers.build
    render layout: false
  end

  def create
    @order_transfer = @order.transfers.build(order_transfer_params)

    respond_to do |format|
      if @order_transfer.save
        format.html { redirect_to documents_orders_url, notice: 'Заказ наряд успешно перемещён.' }
        format.json { render :show, status: :created, location: @order_transfer }
      else
        format.html { render :new }
        format.json { render json: @order_transfer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  private
    def set_order
      @order = Order.find params[:order_id]
    end  
    
    def order_transfer_params
      params.require(:order_transfer).permit(:order_id, 
                                             :source_location_id, 
                                             :destination_location_id, 
                                             :description,
                                             :user_id)
    end
end
