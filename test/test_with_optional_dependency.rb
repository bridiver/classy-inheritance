require File.dirname(__FILE__) + '/test_helper.rb'

class TestWithOptionalDependency < Test::Unit::TestCase
  Author.depends_on :profile, :required => false, 
    :attrs => [:first_name, :last_name, :email]
  
  def setup
    @author = Author.new
  end
  
  def test_author_should_be_valid_without_profile
    @author.login = 'joe'
    
    @author.valid?
    puts @author.errors.full_messages.to_sentence
    
    assert @author.valid?
  end
  
  def test_author_should_be_invalid_with_invalid_profile
    @author.login = 'joe'
    @author.first_name = 'joe'
    
    assert !@author.valid?
  end
  
  def test_author_should_be_valid_with_profile_attributes
    @author.login = 'joe'
    @author.first_name = 'joe'
    @author.last_name = 'bloggs'
    @author.email = 'joe@bloggs.co.uk'
    
    assert @author.valid?
  end
  
end
