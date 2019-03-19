
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruboty/kaiwa/version"

Gem::Specification.new do |spec|
  spec.name          = "ruboty-kaiwa"
  spec.version       = Ruboty::Kaiwa::VERSION
  spec.authors       = ["RenyaMIZUNO"]
  spec.email         = ["renyamizuno@gmail.com"]

  spec.summary       = "Ruboty plugin for chatting japanese."
  spec.description   = "Ruboty plugin for chatting japanese."
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "ruboty"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
end
