# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{deployml}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-03-13}
  s.description = %q{DeploYML is a simple deployment solution that uses a single YAML file and does not require Ruby to be installed on the server.}
  s.email = %q{postmodern.mod3@gmail.com}
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".specopts",
    ".yardopts",
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "deployml.gemspec",
    "lib/deployml.rb",
    "lib/deployml/configuration.rb",
    "lib/deployml/exceptions/config_not_found.rb",
    "lib/deployml/exceptions/invalid_config.rb",
    "lib/deployml/exceptions/missing_option.rb",
    "lib/deployml/exceptions/unknown_framework.rb",
    "lib/deployml/exceptions/unknown_server.rb",
    "lib/deployml/frameworks.rb",
    "lib/deployml/frameworks/rails2.rb",
    "lib/deployml/frameworks/rails3.rb",
    "lib/deployml/local_shell.rb",
    "lib/deployml/options.rb",
    "lib/deployml/options/mongrel.rb",
    "lib/deployml/options/thin.rb",
    "lib/deployml/project.rb",
    "lib/deployml/rake.rb",
    "lib/deployml/rake/tasks.rb",
    "lib/deployml/remote_shell.rb",
    "lib/deployml/servers.rb",
    "lib/deployml/servers/apache.rb",
    "lib/deployml/servers/mongrel.rb",
    "lib/deployml/servers/thin.rb",
    "lib/deployml/shell.rb",
    "lib/deployml/version.rb",
    "spec/configuration_spec.rb",
    "spec/deployml_spec.rb",
    "spec/helpers/projects.rb",
    "spec/helpers/projects/bad_config/config/deploy.yml",
    "spec/helpers/projects/invalid_scm/config/deploy.yml",
    "spec/helpers/projects/invalid_server/config/deploy.yml",
    "spec/helpers/projects/missing_config/.gitkeep",
    "spec/helpers/projects/missing_dest/config/deploy.yml",
    "spec/helpers/projects/missing_source/config/deploy.yml",
    "spec/helpers/projects/one/config/deploy.yml",
    "spec/helpers/projects/two/settings/deploy.yml",
    "spec/project_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/postmodern/deployr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A deployment solution that works.}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/deployml_spec.rb",
    "spec/helpers/projects.rb",
    "spec/configuration_spec.rb",
    "spec/project_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rprogram>, [">= 0.1.8"])
      s.add_runtime_dependency(%q<pullr>, [">= 0.1.0"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_development_dependency(%q<yard>, [">= 0.5.3"])
    else
      s.add_dependency(%q<rprogram>, [">= 0.1.8"])
      s.add_dependency(%q<pullr>, [">= 0.1.0"])
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_dependency(%q<yard>, [">= 0.5.3"])
    end
  else
    s.add_dependency(%q<rprogram>, [">= 0.1.8"])
    s.add_dependency(%q<pullr>, [">= 0.1.0"])
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
    s.add_dependency(%q<yard>, [">= 0.5.3"])
  end
end

