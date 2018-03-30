$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gmail_smtp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gmail_smtp"
  s.version     = GmailSmtp::VERSION
  s.authors     = ["Ben Golden"]
  s.email       = ["bengolden1@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of GmailSmtp."
  s.description = "TODO: Description of GmailSmtp."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.6"

  s.add_development_dependency "sqlite3"
end
