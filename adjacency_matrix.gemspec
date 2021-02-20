require_relative 'lib/adjacency_matrix/version'

Gem::Specification.new do |spec|
  spec.name          = "adjacency_matrix"
  spec.version       = AdjacencyMatrix::VERSION
  spec.authors       = ["Lukas_Skywalker"]
  spec.email         = ["lukas.diener@hotmail.com"]

  spec.summary       = "Adjacency Matrix implementation"
  spec.description   = "Allows storing adjacency matrices"
  spec.homepage      = "https://github.com/code-fabrik/adjacency_matrix"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/code-fabrik/adjacency_matrix"
  spec.metadata["changelog_uri"] = "https://github.com/code-fabrik/adjacency_matrix"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "weighted_graph", "~> 0.1.2"
end
