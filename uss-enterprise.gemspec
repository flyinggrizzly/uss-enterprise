Gem::Specification.new do |spec|
  spec.name               = "uss-enterprise"
  spec.version            = '0.0.3.5'
  spec.date               = '2017-02-10'
  spec.authors            = ["Sean DMR"]
  spec.email              = ["sn@grz.li"]
  spec.summary            = %q{Outputs ASCII art of different Enterprises}
  spec.description        = spec.summary
  spec.homepage           = "https://github.com/flyinggrizzly/uss-enterprise"
  spec.license            = "GPL-3.0"

  spec.executables       << 'enterprise'
  spec.files              = Dir.glob("{bin,lib}/**/*") + %w(readme.md)
  spec.test_files         = ['tests/test_blueprint.rb', 'tests/test_ship_builders.rb', 'tests/test_interactions.rb', 'tests/test_ship_chooser.rb', 'tests/test_uss-enterprise.rb']
  spec.require_paths      = ['lib']
end
