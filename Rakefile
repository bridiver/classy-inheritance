# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'classy-inheritance'

task :default => 'spec:run'

PROJ.name = 'classy-inheritance'
PROJ.authors = 'Andrew Stone'
PROJ.email = 'andy@stonean.com'
PROJ.url = 'http://stonean.com/wiki/classy-inheritance'
PROJ.version = Stonean::ClassyInheritance::VERSION
PROJ.rubyforge.name = 'classyinherit'

PROJ.spec.opts << '--color'

# EOF
