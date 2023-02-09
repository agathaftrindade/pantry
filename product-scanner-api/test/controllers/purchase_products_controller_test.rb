require "test_helper"

class PurchaseProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_product = purchase_products(:one)
  end

  test "should get index" do
    get purchase_products_url, as: :json
    assert_response :success
  end

  test "should create purchase_product" do
    assert_difference("PurchaseProduct.count") do
      post purchase_products_url, params: { purchase_product: { expires_at: @purchase_product.expires_at, price: @purchase_product.price, quantity: @purchase_product.quantity, quantity_type: @purchase_product.quantity_type } }, as: :json
    end

    assert_response :created
  end

  test "should show purchase_product" do
    get purchase_product_url(@purchase_product), as: :json
    assert_response :success
  end

  test "should update purchase_product" do
    patch purchase_product_url(@purchase_product), params: { purchase_product: { expires_at: @purchase_product.expires_at, price: @purchase_product.price, quantity: @purchase_product.quantity, quantity_type: @purchase_product.quantity_type } }, as: :json
    assert_response :success
  end

  test "should destroy purchase_product" do
    assert_difference("PurchaseProduct.count", -1) do
      delete purchase_product_url(@purchase_product), as: :json
    end

    assert_response :no_content
  end
end
