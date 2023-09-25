require "test_helper"

class LocalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @locale = locales(:one)
  end

  test "should get index" do
    get locales_url, as: :json
    assert_response :success
  end

  test "should create locale" do
    assert_difference("Locale.count") do
      post locales_url, params: { locale: { code: @locale.code, description: @locale.description } }, as: :json
    end

    assert_response :created
  end

  test "should show locale" do
    get locale_url(@locale), as: :json
    assert_response :success
  end

  test "should update locale" do
    patch locale_url(@locale), params: { locale: { code: @locale.code, description: @locale.description } }, as: :json
    assert_response :success
  end

  test "should destroy locale" do
    assert_difference("Locale.count", -1) do
      delete locale_url(@locale), as: :json
    end

    assert_response :no_content
  end
end
