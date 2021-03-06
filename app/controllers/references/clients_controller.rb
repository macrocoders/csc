class References::ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html { @clients_total_number = Client.count }
      format.json { render text: Client.search(params[:search]).
                                 ordered_by_name.
                                 page(params[:page]).
                                 to_json(methods: [:address, :legal_status_s])
                  }
      format.js {render layout: false}
    end
  end

  def show
  end

  def new
    @client = Client.new
    respond_to do |format|
      format.html
      format.js {render layout: false}
    end  
  end

  def edit
    respond_to do |format|
      format.html
      format.js {render layout: false}
    end  
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to references_clients_url, notice: 'Контрагент был успешно создан.' }
        format.json { render :show, status: :created, location: @client }
        format.js { render layout: false }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
        format.js { render layout: false }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to references_clients_url, notice: 'Контрагент был успешно изменён.' }
        format.json { render :show, status: :ok, location: @client }
        format.js { render layout: false }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to references_clients_url, notice: 'Контрагент был успешно удалён.' }
      format.json { head :no_content }
    end
  end
  
  def select_clients_dialog
    @clients = Client.search(params[:search]).ordered_by_name.page(params[:page] || 1).per(10)
    session[:clients_page] = params[:page]
    session[:clients_search] = params[:search] 
    render layout: false
  end  

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :phone, :additional_phone, :email, :city, :street, :hous, :flat, :legal_status, :is_buyer, :is_supplier)
    end
end
