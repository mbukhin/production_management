class ProductConfigurationsController < ApplicationController
  before_action :set_product_configuration, only: [:show, :edit, :update, :destroy]

  # GET /product_configurations
  # GET /product_configurations.json
  def index
    @product_configurations = ProductConfiguration.all
  end

  # GET /product_configurations/1
  # GET /product_configurations/1.json
  def show
  end

  # GET /product_configurations/new
  def new
    @product_configuration = ProductConfiguration.new
  end

  # GET /product_configurations/1/edit
  def edit
  end

  # POST /product_configurations
  # POST /product_configurations.json
  def create
    @product_configuration = ProductConfiguration.new(product_configuration_params)

    respond_to do |format|
      if @product_configuration.save
        format.html { redirect_to @product_configuration, notice: 'Product configuration was successfully created.' }
        format.json { render :show, status: :created, location: @product_configuration }
      else
        format.html { render :new }
        format.json { render json: @product_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_configurations/1
  # PATCH/PUT /product_configurations/1.json
  def update
    respond_to do |format|
      if @product_configuration.update(product_configuration_params)
        format.html { redirect_to @product_configuration, notice: 'Product configuration was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_configuration }
      else
        format.html { render :edit }
        format.json { render json: @product_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_configurations/1
  # DELETE /product_configurations/1.json
  def destroy
    @product_configuration.destroy
    respond_to do |format|
      format.html { redirect_to product_configurations_url, notice: 'Product configuration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_configuration
      @product_configuration = ProductConfiguration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_configuration_params
      params.require(:product_configuration).permit(:color, :size, :cogs, :product_id, :sku, :image_url)
    end
end
