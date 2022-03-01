require "test_helper"

class MedstoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medstore = medstores(:one)
  end

  test "should get index" do
    get medstores_url, as: :json
    assert_response :success
  end

  test "should create medstore" do
    assert_difference('Medstore.count') do
      post medstores_url, params: { medstore: { address: @medstore.address, license: @medstore.license, name: @medstore.name, number: @medstore.number } }, as: :json
    end

    assert_response 201
  end

  test "should show medstore" do
    get medstore_url(@medstore), as: :json
    assert_response :success
  end

  test "should update medstore" do
    patch medstore_url(@medstore), params: { medstore: { address: @medstore.address, license: @medstore.license, name: @medstore.name, number: @medstore.number } }, as: :json
    assert_response 200
  end

  test "should destroy medstore" do
    assert_difference('Medstore.count', -1) do
      delete medstore_url(@medstore), as: :json
    end

    assert_response 204
  end
end
