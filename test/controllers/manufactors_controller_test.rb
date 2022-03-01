require "test_helper"

class ManufactorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manufactor = manufactors(:one)
  end

  test "should get index" do
    get manufactors_url, as: :json
    assert_response :success
  end

  test "should create manufactor" do
    assert_difference('Manufactor.count') do
      post manufactors_url, params: { manufactor: { address: @manufactor.address, license: @manufactor.license, name: @manufactor.name, number: @manufactor.number } }, as: :json
    end

    assert_response 201
  end

  test "should show manufactor" do
    get manufactor_url(@manufactor), as: :json
    assert_response :success
  end

  test "should update manufactor" do
    patch manufactor_url(@manufactor), params: { manufactor: { address: @manufactor.address, license: @manufactor.license, name: @manufactor.name, number: @manufactor.number } }, as: :json
    assert_response 200
  end

  test "should destroy manufactor" do
    assert_difference('Manufactor.count', -1) do
      delete manufactor_url(@manufactor), as: :json
    end

    assert_response 204
  end
end
