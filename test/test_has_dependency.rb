require File.dirname(__FILE__) + '/test_helper.rb'

Account.has_dependency :account_login, :attrs => [:login, :password], :foreign_key => :account_email, :primary_key => :email

class TestHasDependency < Test::Unit::TestCase

  def setup
    @account = Account.new
  end
  
  def test_active_record_should_respond_to_depends_on
    assert ActiveRecord::Base.respond_to?(:has_dependency)
  end
  
  def test_account_should_respond_to_find_with_account_login
    assert Account.respond_to?(:find_with_account_login)
  end
  
  def test_account_should_respond_to_login
    assert @account.respond_to?(:login)
  end
  
  def test_account_should_respond_to_login=
    assert @account.respond_to?(:login=)
  end
  
  def test_account_should_respond_to_password
    assert @account.respond_to?(:password)
  end
  
  def test_account_should_respond_to_password=
    assert @account.respond_to?(:password=)
  end
  
  def test_account_should_create_account_login_record
    @account.login = 'joe'
    @account.password = 'password'
    @account.first_name = 'joe'
    @account.last_name = 'bloggs'
    @account.email = 'joe@bloggs.co.uk'
  
    @account.save
  
    @account_login = AccountLogin.find(:first, :conditions => {:account_email => @account.email})
  
    assert_equal @account_login, @account.account_login
  
    assert_equal @account_login.login, @account.login
    assert_equal @account_login.password, @account.password
  end
  
  def test_account_should_be_invalid_without_account_login_attributes
    @account.first_name = 'joe'
    @account.last_name = 'bloggs'
    @account.email = 'joe@bloggs.co.uk'
    assert !@account.valid?
  end
  
  def test_account_should_be_valid_with_account_login_attributes
    @account.login = 'joe'
    @account.password = 'password'
    @account.first_name = 'joe'
    @account.last_name = 'bloggs'
    @account.email = 'joe@bloggs.co.uk'
    
    assert @account.valid?
  end

  def test_account_should_have_nice_error_message
    @account = Account.new(:login => "joe")
    @account.valid?

    assert @account.errors.full_messages.include?("Last name can't be blank")
    assert @account.errors.full_messages.include?("Email can't be blank")
    assert @account.errors.full_messages.include?("First name can't be blank")
    assert @account.errors.full_messages.include?("Password can't be blank")
  end
  
end
