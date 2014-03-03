# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ar_report/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Manish Puri"]
  gem.email         = ["manishspuri@gmail.com"]
  gem.description   = %q{A wrapper to send model reports using using spreadsheet and mail gem}
  gem.summary       = %q{This gem will extract an excel report from a activerecord model and send a report to a specified email}
  gem.homepage      = "https://github.com/Manik-Ratnas/ar_report"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ar_report"
  gem.require_paths = ["lib"]
  gem.version       = ArReport::VERSION

  gem.add_dependency 'rails'
  gem.add_dependency 'spreadsheet'  

  gem.add_dependency 'mail'
  gem.add_development_dependency 'rspec'
  #gem.add_development_dependency 'sqlite3'
end
