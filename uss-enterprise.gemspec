Gem::Specification.new do |spec|
  spec.name               = "uss-enterprise"
  spec.version            = '0.0.2.6'
  spec.date               = '2017-02-03'
  spec.authors            = ["Sean DMR"]
  spec.email              = ["sn@grz.li"]
  spec.summary            = %q{Outputs ASCII art of different Enterprises}
  spec.description        = spec.summary
  spec.homepage           = "https://github.com/flyinggrizzly/uss-enterprise"
  spec.license            = "GPL-3.0"

  spec.executables       << 'enterprise'
  spec.files              = Dir.glob("{bin,lib}/**/*") + %w(readme.md)
  # spec.executables        = ['bin/shrug']
  # spec.test_files         = ['tests/test_shrug.rb']
  # spec.require_paths      = ["lib"]
end
