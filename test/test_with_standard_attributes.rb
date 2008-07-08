require File.dirname(__FILE__) + '/test_helper.rb'

Office.depends_on :billing_address, 
                  :attrs => [:line_one, :line_two, :city, :state_code, :postal_code],
                  :class_name => "Address", 
                  :foreign_key => "billing_address_id", 
                  :prefix => true

Office.depends_on :shipping_address, 
                  :attrs => [:line_one, :line_two, :city, :state_code, :postal_code],
                  :class_name => "Address", 
                  :foreign_key => "shipping_address_id", 
                  :prefix => true

class TestWithStandardAttributes < Test::Unit::TestCase
  def setup
    @office = Office.new
  end
  
  def test_office_should_respond_to_billing_address_line_one
    assert_respond_to(@office, :billing_address_line_one)
  end

  def test_office_should_respond_to_billing_address_line_two
    assert_respond_to(@office, :billing_address_line_two)
  end

  def test_office_should_respond_to_billing_address_city
    assert_respond_to(@office, :billing_address_city)
  end

  def test_office_should_respond_to_billing_address_state_code
    assert_respond_to(@office, :billing_address_state_code)
  end

  def test_office_should_respond_to_billing_address_postal_code
    assert_respond_to(@office, :billing_address_postal_code)
  end

  def test_office_should_respond_to_shipping_address_line_one
    assert_respond_to(@office, :shipping_address_line_one)
  end

  def test_office_should_respond_to_shipping_address_line_two
    assert_respond_to(@office, :shipping_address_line_two)
  end

  def test_office_should_respond_to_shipping_address_city
    assert_respond_to(@office, :shipping_address_city)
  end

  def test_office_should_respond_to_shipping_address_state_code
    assert_respond_to(@office, :shipping_address_state_code)
  end

  def test_office_should_respond_to_shipping_address_postal_code
    assert_respond_to(@office, :shipping_address_postal_code)
  end

  def test_office_should_create_billing_and_shipping_address_records
    @office.name = 'Initest'

    @office.billing_address_line_one = '123 Somewhere'
    @office.billing_address_city = 'Somecity'
    @office.billing_address_postal_code = '12345'

    @office.shipping_address_line_one = '999 MyHouse'
    @office.shipping_address_city = 'Mycity'
    @office.shipping_address_postal_code = '98765'

    @office.save

    @billing_address = Address.find(@office.billing_address_id)
    @shipping_address = Address.find(@office.shipping_address_id)

    assert_equal @billing_address, @office.billing_address

    assert_equal @shipping_address, @office.shipping_address
  end


end
