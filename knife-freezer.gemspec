$:.push File.expand_path("../lib", __FILE__)
require "knife-freezer/version"

Gem::Specification.new do |s|
  s.name        = 'knife-freezer'
  s.version     = Knife::Freezer::VERSION
  s.date        = '2012-06-15'
  s.summary     = "Store attributes in databags based on existing nodes with a role"
  s.description = "Store attributes in databags based on existing nodes with a role"
  s.authors     = ["David Ackerman"]
  s.email       = 'david.ackerman@cybera.ca'
  s.homepage    = "https://github.com/cybera/knife-freezer"
  s.files       = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end