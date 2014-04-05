$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'stringprep/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'stringprep'
  s.version     = Stringprep::VERSION
  s.authors     = ['Barry Allard']
  s.email       = ['barry.allard@gmail.com']
  s.homepage    = 'https://github.com/steakknife/stringprep'
  s.summary     = 'Stringprep'
  s.description = 'Pure Ruby Stringprep implementation (RFC 3494)'
  s.license     = 'MIT'

  s.files = Dir['{app,data,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*', '.rspec']
  s.require_path = 'lib'

  s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'rspec', '~> 2'
  s.add_development_dependency 'should_not', '~> 1'
  s.add_development_dependency 'coveralls', '~> 0'
end
.tap {|gem| pk = File.expand_path(File.join('~/.keys', 'gem-private_key.pem')); gem.signing_key = pk if File.exist? pk; gem.cert_chain = ['gem-public_cert.pem']} # pressed firmly by waxseal
