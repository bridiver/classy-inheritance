require File.dirname(__FILE__) + '/test_helper.rb'

Office.depends_on :billing_address, 
                  :attrs => [:line_one, :line_two, :city, :state_code, :postal_code],
                  :class_name => "Address", 
                  :foreign_key => "billing_address_id", 
                  :postfix => true

Office.depends_on :shipping_address, 
                  :attrs => [:line_one, :line_two, :city, :state_code, :postal_code],
                  :class_name => "Address", 
                  :foreign_key => "shipping_address_id", 
                  :prefix => "shipping"

User.depends_on :profile, :attrs => [:first_name, :last_name, :email], :prefix => "personal", :postfix => "information"

class TestWithPrefixPostfix < Test::Unit::TestCase
  def setup
    @office = Office.new
    @user = User.new
  end
  
  def test_office_should_respond_to_line_one_billing_address
    assert_respond_to(@office, :line_one_billing_address)
  end

  def test_office_should_respond_to_line_two_billing_address
    assert_respond_to(@office, :line_two_billing_address)
  end

  def test_office_should_respond_to_city_billing_address
    assert_respond_to(@office, :city_billing_address)
  end

  def test_office_should_respond_to_billing_address_state_code
    assert_respond_to(@office, :billing_address_state_code)
  end

  def test_office_should_respond_to_postal_code_billing_address
    assert_respond_to(@office, :postal_code_billing_address)
  end

  def test_office_should_respond_to_shipping_line_one
    assert_respond_to(@office, :shipping_line_one)
  end

  def test_office_should_respond_to_shipping_line_two
    assert_respond_to(@office, :shipping_line_two)
  end

  def test_office_should_respond_to_shipping_city
    assert_respond_to(@office, :shipping_city)
  end

  def test_office_should_respond_to_shipping_state_code
    assert_respond_to(@office, :shipping_state_code)
  end

  def test_office_should_respond_to_shipping_postal_code
    assert_respond_to(@office, :shipping_postal_code)
  end

  def test_office_should_create_billing_and_shipping_address_records
    @office.name = 'Initest'

    @office.line_one_billing_address = '123 Somewhere'
    @office.city_billing_address = 'Somecity'
    @office.postal_code_billing_address = '12345'

    @office.shipping_line_one = '999 MyHouse'
    @office.shipping_city = 'Mycity'
    @office.shipping_postal_code = '98765'

    @office.save

    @billing_address = Address.find(@office.billing_address_id)
    @shipping_address = Address.find(@office.shipping_address_id)

    assert_equal @billing_address, @office.billing_address

    assert_equal @shipping_address, @office.shipping_address
  end

  def test_user_should_respond_to_personal_first_name_information
    assert_respond_to(@user,:personal_first_name_information)
  end

  def test_user_should_respond_to_personal_last_name_information
    assert_respond_to(@user,:personal_last_name_information)
  end

  def test_user_should_respond_to_personal_email_information
    assert_respond_to(@user,:personal_email_information)
  end
  
end
