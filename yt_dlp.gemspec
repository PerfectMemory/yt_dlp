# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yt_dlp/version'

Gem::Specification.new do |spec|
  spec.name          = 'yt_dlp'
  spec.version       = YtDlp::VERSION
  spec.authors       = ['Axel Delsol']
  spec.email         = ['axel.delsol@perfect-memory.com']

  spec.summary       = 'yt-dlp wrapper for Ruby'
  spec.description   = 'Command line wrapper for the python script yt-dlp'
  spec.homepage      = 'https://github.com/PerfectMemory/yt-dlp'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6'

  spec.add_runtime_dependency 'terrapin', '~> 0'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.3'
end
