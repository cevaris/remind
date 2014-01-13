require 'test_helper'

class MailerControllerTest < ActionController::TestCase
  test "sms recieve" do
    request.env['RAW_POST_DATA'] = {"From" => "+15594516126", "Body" => 'This is test body'}.to_json
    post :sms_receive, {"From" => "+15594516126", "Body" => 'This is test body'}
  end
  # 
  # http://dev-remind.herokuapp.com/sms/receive
end
