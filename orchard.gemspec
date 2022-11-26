# frozen_string_literal: true

require_relative "lib/orchard/version"

Gem::Specification.new do |spec|
  spec.name = "orchard-api-client-anm"
  spec.version = Orchard::VERSION
  spec.authors = ["Sydney Dapilah"]
  spec.email = ["sydney@appsnmobilesolutions.com"]

  spec.summary = "Orchard API client"
  spec.description = "Orchard API client"
  spec.homepage = "https://appsnmobilesolutions.com/services/orchard/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/appsnmobile-solutions/orchard_api_client_gem"

  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_dependency "faraday", "~> 2.6"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
