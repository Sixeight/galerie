require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def make_with(attributes)
  User.new attributes
end

describe User do
  fixtures :users

  before(:each) do
    @valid_attributes = {
      :name => 'david',
      :password => 'foobar',
      :password_confirmation => 'foobar',
    }

    @invalid_attributes = {
      :name => '',
      :password => 'hoge',
      :password_confirmation => 'hoge',
    }

    @unmatch_password = {
      :name => 'michael',
      :password => 'hehe',
      :password_confirmation => 'hoge',
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  it 'は、名前がないと正しく生成されない' do
    user = make_with @invalid_attributes
    user.should_not be_valid
  end

  it 'は、パスワードが一致しなければ作成されない' do
    user = make_with @unmatch_password
    user.should_not be_valid
  end

  it 'should be hogehoge' do
    p User.all
  end
end
