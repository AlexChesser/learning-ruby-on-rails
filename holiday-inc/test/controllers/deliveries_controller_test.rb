require "test_helper"

class DeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery = deliveries(:one)
  end

  test "should get index" do
    get deliveries_url, as: :json
    assert_response :success
  end

  test "should create delivery" do
    assert_difference("Delivery.count") do
      post deliveries_url, params: { delivery: { assigned_to_id: @delivery.assigned_to_id, customer_id: @delivery.customer_id, delivery_date: @delivery.delivery_date, destination_id: @delivery.destination_id, is_complete: @delivery.is_complete, manifest: @delivery.manifest } }, as: :json
    end

    assert_response :created
  end

  test "should show delivery" do
    get delivery_url(@delivery), as: :json
    assert_response :success
  end

  test "should update delivery" do
    patch delivery_url(@delivery), params: { delivery: { assigned_to_id: @delivery.assigned_to_id, customer_id: @delivery.customer_id, delivery_date: @delivery.delivery_date, destination_id: @delivery.destination_id, is_complete: @delivery.is_complete, manifest: @delivery.manifest } }, as: :json
    assert_response :success
  end

  test "should destroy delivery" do
    assert_difference("Delivery.count", -1) do
      delete delivery_url(@delivery), as: :json
    end

    assert_response :no_content
  end
end
