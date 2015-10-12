# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'benchmark_methods/version'

Gem::Specification.new do |spec|
  spec.name          = "benchmark_methods"
  spec.version       = BenchmarkMethods::VERSION
  spec.authors       = ["Igor Kasyanchuk"]
  spec.email         = ["igorkasyanchuk@gmail.com"]

  spec.summary       = %q{Measure and benchmark execution time of your ruby methods}
  spec.description   = %q{Measure and benchmark execution time of your ruby methods. Forgot about `Time.now - t`. Use `benchmark` to see how much time it take to execute your method.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "activerecord", "> 0"
  spec.add_development_dependency "rspec", "> 0"
  spec.add_development_dependency "pry", "> 0"
  spec.add_development_dependency "simplecov", "> 0"
  spec.add_development_dependency 'sqlite3', "> 0"
end
