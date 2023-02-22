class PurchaseProductsController < ApplicationController
  before_action :set_purchase
  # before_action :set_purchase_product, only: %i[ show update destroy ]

  # GET /items
  def index
    @purchase_products = @purchase.items

    render json: @purchase_products, each_serializer: PurchaseProductSerializer, include: ['product', 'product.brand']
  end

  #   # GET /purchase_products/1
  #   def show
  #     render json: @purchase_product
  #   end

  # POST /items
  def create
    @purchase_product = PurchaseProduct.new(purchase_product_params)

    product = Product.find_by id: params[:product_id]

    @purchase_product.product = product
    @purchase_product.purchase = @purchase

    if @purchase_product.save
      render json: @purchase_product, status: :created
    else
      render json: build_error(@purchase_product.errors), status: :unprocessable_entity
    end
  end

  #   # PATCH/PUT /purchase_products/1
  #   def update
  #     if @purchase_product.update(purchase_product_params)
  #       render json: @purchase_product
  #     else
  #       render json: @purchase_product.errors, status: :unprocessable_entity
  #     end
  #   end

  #   # DELETE /purchase_products/1
  #   def destroy
  #     @purchase_product.destroy
  #   end

  private
  def set_purchase
    @purchase = Purchase.find(params[:purchase_id])
  end

  def purchase_product_params
    params.require(:purchase_product)
      .permit(:product_id, :price, :quantity, :quantity_type, :expires_at)
  end
end
