require "test_helper"

class LocalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @locale = locales(:one)
  end

  test "should get index" do
    get locales_url
    assert_response :success
  end

  test "should get new" do
    get new_locale_url
    assert_response :success
  end

  test "should create locale" do
    assert_difference("Locale.count") do
      post locales_url, params: { locale: { code: @locale.code, description: @locale.description } }
    end

    assert_redirected_to locale_url(Locale.last)
  end

  test "should show locale" do
    get locale_url(@locale)
    assert_response :success
  end

  test "should get edit" do
    get edit_locale_url(@locale)
    assert_response :success
  end

  test "should update locale" do
    patch locale_url(@locale), params: { locale: { code: @locale.code, description: @locale.description } }
    assert_redirected_to locale_url(@locale)
  end

  test "should destroy locale" do
    assert_difference("Locale.count", -1) do
      delete locale_url(@locale)
    end

    assert_redirected_to locales_url
  end
end
