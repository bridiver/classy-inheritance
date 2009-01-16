Gem::Specification.new do |s|
  s.name = %q{classy-inheritance}
  s.version = "0.6.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Stone"]
  s.date = %q{2009-01-13}
  s.description = %q{Adds a depends_on class method to your ActiveRecord model so that you can define requisite objects.}
  s.email = ["andy@stonean.com"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/classy-inheritance.rb", "test/test_classy-inheritance.rb", "test/test_helper.rb", "test/test_polymorphic_associations.rb", "test/test_with_optional_dependency.rb", "test/test_with_prefix_postfix.rb", "test/test_with_standard_attributes.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://classyinherit.rubyforge.org}
  s.post_install_message = %q{}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{classyinherit}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Adds a depends_on class method to your ActiveRecord model so that you can define requisite objects.}
  s.test_files = ["test/test_classy-inheritance.rb", "test/test_helper.rb", "test/test_polymorphic_associations.rb", "test/test_with_optional_dependency.rb", "test/test_with_prefix_postfix.rb", "test/test_with_standard_attributes.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
