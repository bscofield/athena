# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'athena'

task :default => 'spec:run'

PROJ.name = 'athena'
PROJ.authors = 'Ben Scofield'
PROJ.email = 'athena@turrean.com'
PROJ.url = 'FIXME (project homepage)'
PROJ.rubyforge.name = 'athena'

PROJ.spec.opts << '--color'

# EOF
