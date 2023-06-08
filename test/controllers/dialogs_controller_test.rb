require 'test_helper'

class DialogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dialogs_index_url
    assert_response :success
  end

end
