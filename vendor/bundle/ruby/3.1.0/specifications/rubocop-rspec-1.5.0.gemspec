# -*- encoding: utf-8 -*-
# stub: rubocop-rspec 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-rspec".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ian MacLeod".freeze, "Nils Gemeinhardt".freeze]
  s.date = "2016-05-18"
  s.description = "    Code style checking for RSpec files.\n    A plugin for the RuboCop code style enforcing & linting tool.\n".freeze
  s.email = ["ian@nevir.net".freeze, "git@nilsgemeinhardt.de".freeze]
  s.extra_rdoc_files = ["MIT-LICENSE.md".freeze, "README.md".freeze]
  s.files = ["MIT-LICENSE.md".freeze, "README.md".freeze]
  s.homepage = "http://github.com/nevir/rubocop-rspec".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.3.3".freeze
  s.summary = "Code style checking for RSpec files".freeze

  s.installed_by_version = "3.3.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rubocop>.freeze, [">= 0.40.0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 3.4"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rubocop>.freeze, [">= 0.40.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.4"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
