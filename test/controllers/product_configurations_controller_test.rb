require 'test_helper'

class ProductConfigurationsControllerTest < ActionController::TestCase
  setup do
    @product_configuration = product_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_configuration" do
    assert_difference('ProductConfiguration.count') do
      post :create, product_configuration: { cogs: @product_configuration.cogs, color: @product_configuration.color, image_url: @product_configuration.image_url, product_id: @product_configuration.product_id, size: @product_configuration.size, sku: @product_configuration.sku }
    end

    assert_redirected_to product_configuration_path(assigns(:product_configuration))
  end

  test "should show product_configuration" do
    get :show, id: @product_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_configuration
    assert_response :success
  end

  test "should update product_configuration" do
    patch :update, id: @product_configuration, product_configuration: { cogs: @product_configuration.cogs, color: @product_configuration.color, image_url: @product_configuration.image_url, product_id: @product_configuration.product_id, size: @product_configuration.size, sku: @product_configuration.sku }
    assert_redirected_to product_configuration_path(assigns(:product_configuration))
  end

  test "should destroy product_configuration" do
    assert_difference('ProductConfiguration.count', -1) do
      delete :destroy, id: @product_configuration
    end

    assert_redirected_to product_configurations_path
  end
end
