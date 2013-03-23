$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scroll/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scroll"
  s.version     = Scroll::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Scroll."
  s.description = "TODO: Description of Scroll."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "strong_parameters"
  s.add_dependency "redcarpet"
  s.add_dependency "paperclip"

  s.add_development_dependency "sqlite3"
end
