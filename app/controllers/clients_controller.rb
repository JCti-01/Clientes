class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  def index
    @clients = current_user.clients
    if params[:query].present?
      @clients = @clients.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  # GET /clients/:id
  def show
  end

  # GET /clients/new
  def new
    @client = current_user.clients.build
  end

  # POST /clients
  def create
    @client = current_user.clients.build(client_params)
    if @client.save
      redirect_to clients_path, notice: "Cliente criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /clients/:id/edit
  def edit
  end

  # PATCH/PUT /clients/:id
  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: "Cliente atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /clients/:id
  def destroy
    @client.destroy
    redirect_to clients_path, notice: "Cliente deletado com sucesso."
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :birthdate, :phone, :description, :active, :client_image)
  end
end
