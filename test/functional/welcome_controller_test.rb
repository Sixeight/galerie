require File.dirname(__FILE__) + '/../test_helper'

class WelcomeControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def setup 
    @controller = WelcomeController.new 
    @request    = ActionController::TestRequest.new 
    @response   = ActionController::TestResponse.new
  end

  def test_truth
    assert true
  end

  def test_jump_to_login_form
    get :login
    assert_response :success
    assert_template 'login'
  end
end
