class ClientAddressesController < ApplicationController
  before_action :set_client
  before_action :set_client_address, only: %i[edit update destroy]

  # GET /clients/:client_id/client_addresses
  def index
    @client_addresses = @client.client_addresses
  end

  # GET /clients/:client_id/client_addresses/new
  def new
    @client_address = @client.client_addresses.build
  end

  # POST /clients/:client_id/client_addresses
  def create
    @client_address = @client.client_addresses.build(client_address_params)

    if @client_address.save
      redirect_to client_path(@client), notice: "Endereço criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /clients/:client_id/client_addresses/:id/edit
  def edit
  end

  # PATCH/PUT /clients/:client_id/client_addresses/:id
  def update
    if @client_address.update(client_address_params)
      redirect_to client_path(@client), notice: "Endereço atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /clients/:client_id/client_addresses/:id
  def destroy
    @client_address.destroy
    redirect_to client_path(@client), notice: "Endereço deletado com sucesso."
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_client_address
    @client_address = @client.client_addresses.find(params[:id])
  end

  def client_address_params
    params.require(:client_address).permit(:address, :number, :city, :state, :zip, :reference, :country, :active)
  end
end
