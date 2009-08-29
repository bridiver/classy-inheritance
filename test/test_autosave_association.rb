require File.dirname(__FILE__) + '/test_helper.rb'

class TestClassyInheritance < Test::Unit::TestCase

  def setup
    User.depends_on :profile, :attrs => [:first_name, :last_name, :email], :autosave => true
    @user = User.new
  end
  
  def test_user_should_not_respond_to_save_requisite_user
    assert !@user.respond_to?(:save_requisite_user)
  end
    
end
