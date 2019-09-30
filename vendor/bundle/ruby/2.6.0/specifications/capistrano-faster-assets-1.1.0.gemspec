# -*- encoding: utf-8 -*-
# stub: capistrano-faster-assets 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-faster-assets".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrew Thal".freeze, "Ruben Stranders".freeze]
  s.date = "2017-10-23"
  s.description = "Speeds up asset compilation by skipping the assets:precompile task if none of the assets were changed since last release.\nWorks *only* with Capistrano 3+.\nBased on https://coderwall.com/p/aridag\n".freeze
  s.email = ["athal7@me.com".freeze, "r.stranders@gmail.com".freeze]
  s.homepage = "https://github.com/capistrano-plugins/capistrano-faster-assets".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Speeds up asset compilation if none of the assets were changed since last release.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, [">= 3.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<capistrano>.freeze, [">= 3.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, [">= 3.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
