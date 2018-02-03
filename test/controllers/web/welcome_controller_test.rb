require 'test_helper'

class Web::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get welcome_index_url

    assert_response :success
  end
end
