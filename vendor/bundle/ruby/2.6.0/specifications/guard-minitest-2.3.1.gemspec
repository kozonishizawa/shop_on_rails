# -*- encoding: utf-8 -*-
# stub: guard-minitest 2.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "guard-minitest".freeze
  s.version = "2.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yann Lugrin".freeze, "R\u00E9my Coutable".freeze]
  s.date = "2014-06-22"
  s.description = "Guard::Minitest automatically run your tests with Minitest framework (much like autotest)".freeze
  s.email = ["remy@rymai.me".freeze]
  s.homepage = "https://rubygems.org/gems/guard-minitest".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Guard plugin for the Minitest framework".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<minitest>.freeze, [">= 3.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    else
      s.add_dependency(%q<guard>.freeze, ["~> 2.0"])
      s.add_dependency(%q<minitest>.freeze, [">= 3.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<guard>.freeze, ["~> 2.0"])
    s.add_dependency(%q<minitest>.freeze, [">= 3.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
  end
end
