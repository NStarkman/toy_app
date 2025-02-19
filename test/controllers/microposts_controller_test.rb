require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
    @user = users(:one) # Ensure a valid user fixture is available
    @micropost.user_id = @user.id
  end

  test "should get index" do
    get microposts_url
    assert_response :success
  end

  test "should get new" do
    get new_micropost_url
    assert_response :success
  end

  test "should create micropost" do
    puts "Micropost count before test: #{Micropost.count}"
    assert_difference("Micropost.count") do
      puts "Micropost data: #{@micropost.user_id}"
      post microposts_url, params: { micropost: { content: "Valid content", user_id: @micropost.user_id } }
      puts "Micropost count before test: #{Micropost.count}"
    end

    assert_redirected_to micropost_url(Micropost.last)
  end

  test "should show micropost" do
    get micropost_url(@micropost)
    assert_response :success
  end

  test "should get edit" do
    get edit_micropost_url(@micropost)
    assert_response :success
  end

  test "should update micropost" do
    patch micropost_url(@micropost), params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }
    assert_redirected_to micropost_url(@micropost)
  end

  test "should destroy micropost" do
    assert_difference("Micropost.count", -1) do
      delete micropost_url(@micropost)
    end

    assert_redirected_to microposts_url
  end
end
