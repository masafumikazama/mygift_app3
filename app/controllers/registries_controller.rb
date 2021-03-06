class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  # GET /registries
  # GET /registries.json
  def index
    @registries = Registry.all
  end

  # GET /registries/1
  # GET /registries/1.json
  def show
    @registry = Registry.find(params[:id])
    @gifts = @registry.gifts.all
  end

  # GET /registries/new
  def new
    @registry = Registry.new
  end

  # GET /registries/1/edit
  def edit
  end

  # POST /registries
  # POST /registries.json
  def create
    @user = User.find_by(params[:id])
    @registry = Registry.new(registry_params)
    @registry.user_id = current_user.id
    respond_to do |format|
      if @registry.save
        format.html { redirect_to @user, notice: 'Registry was successfully created.' }
        format.json { render :show, status: :created, location: @registry }
      else
        format.html { render :new }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registries/1
  # PATCH/PUT /registries/1.json
  def update
    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to @registry, notice: 'Registry was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry }
      else
        format.html { render :edit }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registries/1
  # DELETE /registries/1.json
  def destroy
    @registry.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id), notice: 'Registry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def searched_registry
    @registry = Registry.find(params[:id])
    @gifts = @registry.gifts.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = Registry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registry_params
      params.require(:registry).permit(:title, :welcome_message, :due_date, :user_id)
    end
end
