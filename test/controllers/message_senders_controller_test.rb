require 'test_helper'

class MessageSendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get message_senders_index_url
    assert_response :success
  end

end
