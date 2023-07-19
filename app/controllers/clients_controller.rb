class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :set_types, only: [:new, :edit, :show, :create] 

  before_action :authenticate_user! #, except: [:index, :show]
  # before_action only: [:edit, :update, :destroy] do
  #   authorize_request(["concierge", "admin"])
  # end
  before_action only: [:destroy, :edit, :update, :index, :show] do
    authorize_request(["admin"])
  end

  # GET /clients or /clients.json
  def index
    @clients = Client.all
    @pagy,@clients = pagy(Client.all)
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)    

    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end
   
    def set_types
      @types = Type.all.map{ |t| [t.nombre, t.id] }
    end
    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:nombre, :email, :type_id)
    end
end
