require File.dirname(__FILE__) + '/test_helper.rb'

class TestWithClassNameEndingWithSS < Test::Unit::TestCase
  def test_should_be_able_to_set_class_names_ending_with_ss
    assert_nothing_raised do
      User.depends_on :address, :as => :owner, :attrs => [:city], :class_name => "Address"
    end
  end
end

