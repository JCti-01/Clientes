class ClientAddressesController < ApplicationController
  before_action :set_client_address, only: %i[ show edit update destroy ]

  # GET /client_addresses or /client_addresses.json
  def index
    @client_addresses = ClientAddress.all
  end

  # GET /client_addresses/1 or /client_addresses/1.json
  def show
  end

  # GET /client_addresses/new
  def new
    @client_address = ClientAddress.new
  end

  # GET /client_addresses/1/edit
  def edit
  end

  # POST /client_addresses or /client_addresses.json
  def create
    @client_address = ClientAddress.new(client_address_params)

    respond_to do |format|
      if @client_address.save
        format.html { redirect_to @client_address, notice: "Client address was successfully created." }
        format.json { render :show, status: :created, location: @client_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_addresses/1 or /client_addresses/1.json
  def update
    respond_to do |format|
      if @client_address.update(client_address_params)
        format.html { redirect_to @client_address, notice: "Client address was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @client_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_addresses/1 or /client_addresses/1.json
  def destroy
    @client_address.destroy!

    respond_to do |format|
      format.html { redirect_to client_addresses_path, notice: "Client address was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_address
      @client_address = ClientAddress.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def client_address_params
      params.require(:client_address).permit(:address, :number, :city, :state, :zip, :reference, :client_id)
    end
end
