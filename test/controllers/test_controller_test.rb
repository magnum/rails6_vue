require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get say_hello" do
    get test_say_hello_url
    assert_response :success
  end

end
