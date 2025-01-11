$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "debitcredit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "debitcredit"
  s.version     = Debitcredit::VERSION
  s.authors     = ["Vitaly Kushner"]
  s.email       = ["vitaly@astrails.com"]
  s.homepage    = "http://github.com/vitaly/debitcredit"
  s.summary     = "Double entry accounting for Rails applications"
  s.description = "Double entry accounting for Rails applications"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # Update the Ruby version requirement to Ruby 3.2.6
  s.required_ruby_version = '>= 3.2.6'

  s.add_dependency "rails", "~> 6.1.7.10"
  s.add_dependency "docile"
  s.add_dependency 'bigdecimal', '~> 3.1'

  s.add_development_dependency "sqlite3", "~> 1.4"
  s.add_development_dependency "rspec-rails", "~> 4.0"
end
