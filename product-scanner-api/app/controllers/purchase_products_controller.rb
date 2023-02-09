class PurchaseProductsController < ApplicationController
  before_action :set_purchase_product, only: %i[ show update destroy ]

  # GET /purchase_products
  def index
    @purchase_products = PurchaseProduct.all

    render json: @purchase_products
  end

  # GET /purchase_products/1
  def show
    render json: @purchase_product
  end

  # POST /purchase_products
  def create
    @purchase_product = PurchaseProduct.new(purchase_product_params)

    if @purchase_product.save
      render json: @purchase_product, status: :created, location: @purchase_product
    else
      render json: @purchase_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchase_products/1
  def update
    if @purchase_product.update(purchase_product_params)
      render json: @purchase_product
    else
      render json: @purchase_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchase_products/1
  def destroy
    @purchase_product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_product
      @purchase_product = PurchaseProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_product_params
      params.require(:purchase_product).permit(:price, :quantity, :quantity_type, :expires_at)
    end
end
