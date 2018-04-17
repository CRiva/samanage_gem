
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "samanage/version"

Gem::Specification.new do |spec|
  spec.name          = "samanage"
  spec.version       = Samanage::VERSION
  spec.authors       = ["Connor Riva", "Dave Lundgren", "Tjaart van der Walt"]
  spec.email         = ['criva@westmont.edu', 'dlungren@outsideopen.com',  'tjaart@outsideopen.com']

  spec.summary       = %q{To create a Samanage support ticket}
  spec.description   = %q{A gem for basic ticket creation with Samange. Uses Samanage API V2.1}
  spec.homepage      = "https://bitbucket.org/westmont/samanage_gem/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|fixtures)/})
  end
  spec.files         = spec.files + ["lib/samanage/configuration.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "= 4.0.0"
  spec.add_development_dependency "webmock", "= 3.3.0"

  
end
