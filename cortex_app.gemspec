# frozen_string_literal: true

require_relative 'lib/cortex_app/version'

Gem::Specification.new do |spec|
  spec.name = 'cortex_app'
  spec.version = CortexApp::VERSION
  spec.authors = ['BetterUp Developers']

  spec.summary = 'Ruby client for Cortex API'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.22'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
