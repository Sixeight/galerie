require File.dirname(__FILE__) + '/../test_helper'

class MenuControllerTest < ActionController::TestCase
  fixtures :users, :images

  # Replace this with your real tests.
  def setup
    @controller = MenuController.new 
    @request    = ActionController::TestRequest.new 
    @response   = ActionController::TestResponse.new
  end

  def test_truth
    assert true
  end

  def test_index
    login
    get :index
    assert_response :success
    assert_template 'index'
    assert_select 'table'
  end

  def test_index__redirect_to_login
    get :index
    assert_response :redirect
    assert_redirected_to :controller => :welcome, :action => :login
  end

  def test_upload
    login
    get :upload
    assert_response :success
    assert_template 'upload'
    assert_select 'input'
  end

  def test_upload__redirect_to_login
    get :upload
    assert_response :redirect
    assert_redirected_to :controller => :welcome, :action => :login
  end

  private
  def login
    @request.session[:user_id] = users(:tomohiro).id
  end
end
