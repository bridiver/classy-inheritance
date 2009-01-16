require File.dirname(__FILE__) + '/test_helper.rb'

User.depends_on :profile, :attrs => [:first_name, :last_name, :email]

class TestClassyInheritance < Test::Unit::TestCase

  def setup
    @user = User.new
  end
  
  def test_active_record_should_respond_to_depends_on
    assert ActiveRecord::Base.respond_to?(:depends_on)
  end
  
  def test_user_should_respond_to_find_with_profile
    assert User.respond_to?(:find_with_profile)
  end

  def test_user_should_respond_to_first_name
    assert @user.respond_to?(:first_name)
  end
  
  def test_user_should_respond_to_first_name=
    assert @user.respond_to?(:first_name=)
  end
  
  def test_user_should_respond_to_last_name
    assert @user.respond_to?(:last_name)
  end
  
  def test_user_should_respond_to_last_name=
    assert @user.respond_to?(:last_name=)
  end
  
  def test_user_should_respond_to_email
    assert @user.respond_to?(:email)
  end
  
  def test_user_should_respond_to_email=
    assert @user.respond_to?(:email=)
  end
  
  def test_user_should_be_invalid_without_profile_attributes
    @user.login = 'joe'
    assert !@user.valid?
  end
  
  def test_user_should_valid_with_profile_attributes
    @user.login = 'joe'
    @user.first_name = 'joe'
    @user.last_name = 'bloggs'
    @user.email = 'joe@bloggs.co.uk'
    
    assert @user.valid?
  end

  def test_user_should_have_nice_error_message
    @user = User.new(:first_name => "andy")
    @user.valid?

    assert @user.errors.full_messages.include?("Last name can't be blank")
    assert @user.errors.full_messages.include?("Email can't be blank")
    assert @user.errors.full_messages.include?("Login can't be blank")
  end
  
end
