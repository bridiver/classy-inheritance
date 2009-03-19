# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{classy-inheritance}
  s.version = "0.6.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Stone"]
  s.date = %q{2009-03-19}
  s.description = %q{Classy Inheritance adds a depends_on class method to your ActiveRecord model so that you can define requisite objects.  This functionality is provided using the existing ActiveRecord methods without monkey patching any core code. Essentially, it provides an easy interface to generate code that anyone could add to their model to receive the same result. Depending on the parameters to your depends_on call, it may add some of the following methods: validates_presence_of, validates_associated, has_one or belongs_to.}
  s.email = %q{andy@stonean.com}
  s.extra_rdoc_files = ["History.txt", "License.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/classy-inheritance.rb", "test/test_classy-inheritance.rb", "test/test_helper.rb", "test/test_polymorphic_associations.rb", "test/test_with_optional_dependency.rb", "test/test_with_prefix_postfix.rb", "test/test_with_standard_attributes.rb", "test/test_has_dependency.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://stonean.com/wiki/classy-inheritance}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{classyinherit}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Classy Inheritance adds a depends_on class method to your ActiveRecord model so that you can define requisite objects}
  s.test_files = ["test/test_classy-inheritance.rb", "test/test_has_dependency.rb", "test/test_helper.rb", "test/test_polymorphic_associations.rb", "test/test_with_optional_dependency.rb", "test/test_with_prefix_postfix.rb", "test/test_with_standard_attributes.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.2.0"])
    else
      s.add_dependency(%q<bones>, [">= 2.2.0"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.2.0"])
  end
end
