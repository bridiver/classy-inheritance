require File.dirname(__FILE__) + '/test_helper.rb'

class TestWithOptionalDependency < Test::Unit::TestCase
  # Turn off the validates_presence_of call
  Author.depends_on :profile, :validates_presence_if => false, 
    :attrs => [:first_name, :last_name, :email]
  
  # Turn off the validates_presence_of and the validates_associated calls
  Artist.depends_on :profile, :validates_presence_if => false, 
    :validates_associated_if => false,
    :attrs => [:first_name, :last_name, :email]

  def setup
    @author = Author.new
    @artist = Artist.new
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

  def test_artist_should_not_save_with_invalid_profile
    @artist.login = 'joe'
    @artist.first_name = 'joe'
    
    assert !@artist.save
  end

  def test_artist_should_save_with_valid_profile
    @artist.login = 'joe'
    @artist.first_name = 'joe'
    @artist.last_name = 'bloggs'
    @artist.email = 'joe@bloggs.co.uk'
    
    assert @artist.save
  end
  
end
