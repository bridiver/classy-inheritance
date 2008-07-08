require File.dirname(__FILE__) + '/test_helper.rb'

Content.can_be :document, :as => :presentable

Page.depends_on :content, :attrs => [:name], :as => :presentable

class TestPolymorphicAssociations < Test::Unit::TestCase

  def setup
    @page = Page.new

    @test_page = Page.create(:name => 'My Page', :body => 'Something interesting')
    @test_content = @test_page.content
  end

  # from Content.can_be declaration
  def test_document_should_respond_to_find_with_content
    assert Document.respond_to?(:find_with_content)
  end

  def test_page_should_respond_to_name
    assert @page.respond_to?(:name)
  end

  def test_page_should_fail_validation_without_content_name
    @page.body = 'Some really informative stuff that would be a lot longer'
    assert !@page.valid?
  end

  def test_page_should_pass_validation_with_content_name
    @page.name = 'First Page'
    @page.body = 'Some really informative stuff that would be a lot longer'
    assert @page.valid?
  end

  def test_page_should_create_content
    @page.name = 'First Page'
    @page.body = 'Some really informative stuff that would be a lot longer'
    @page.save

    assert @page.content.id != nil
  end

  def test_content_should_respond_to_is_a_document
    assert @test_content.respond_to?(:is_a_document?)
  end

  def test_content_should_respond_to_as_a_document
    assert @test_content.respond_to?(:as_a_document)
  end

  def test_content_should_respond_to_is_a_page
    assert @test_content.respond_to?(:is_a_page?)
  end

  def test_content_should_respond_to_as_a_page
    assert @test_content.respond_to?(:as_a_page)
  end

  def test_content_should_return_page_object
    assert @test_content.as_a_page.is_a?(Page)
  end
  
end
