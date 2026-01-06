lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "pg_sequencer/version"

Gem::Specification.new do |spec|
  spec.name           = "pg_sequencer"
  spec.version        = PgSequencer::VERSION
  spec.authors        = ["Tony Collen", "Aaron Ackerman", "Ben Linton", "J. R. Schmid", "aifinyo AG"]
  spec.email          = ["dev@aifinyo.de"]
  spec.homepage       = "https://github.com/aifinyo-ag/pg_sequencer"
  spec.license        = "MIT"
  spec.summary        = "Manage postgres sequences in rails migrations"
  spec.description    = "Sequences need some love. pg_sequencer teaches Rails what sequences are, and will dump them to schema.rb, and also lets you create/drop sequences in migrations. Modernized fork with Ruby 3.2+, Rails 8.0+, and PostgreSQL 15+ support, maintained by aifinyo AG."

  spec.files          = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(\test|spec|features)/}) }
  spec.bindir         = "bin"
  spec.executables    = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths  = ["lib"]

  spec.required_ruby_version = ">= 3.2.0"

  spec.add_runtime_dependency "activesupport", ">= 8.0.0", "< 9.0"
  spec.add_runtime_dependency "activerecord", ">= 8.0.0", "< 9.0"

  spec.add_development_dependency "pg", ">= 1.6.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.13"
  spec.add_development_dependency "pry"
end
