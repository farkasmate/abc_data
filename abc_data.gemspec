
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "abc_data/version"

Gem::Specification.new do |spec|
  spec.name          = "abc_data"
  spec.version       = AbcData::VERSION
  spec.authors       = ["Mate Farkas"]
  spec.email         = ["mate.farkas@sch.hu"]

  spec.summary       = %q{Format data into alphabetical order}
  spec.homepage      = "https://github.com/farkasmate/abc_data"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
