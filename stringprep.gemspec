$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'stringprep/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'stringprep'
  s.version     = Stringprep::VERSION
  s.authors     = ['Barry Allard']
  s.email       = ['barry.allard@gmail.com']
  s.homepage    = github_url = 'https://github.com/steakknife/stringprep'
    s.metadata = {
    'source_code_uri' => "#{github_url}.git",
#   'documentation_uri' => "",
        'project_uri' => github_url,
    'bug_tracker_uri' => "#{github_url}/issues",
           'wiki_uri' => "#{github_url}/wiki",
#    'mailing_list_uri' => "",
  }
  s.summary     = 'Stringprep'
  s.description = 'Pure Ruby Stringprep implementation (RFC 3494)'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*', '.rspec']
  s.require_path = 'lib'

  s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'rspec', '~> 2'
  s.add_development_dependency 'should_not', '~> 1'
end
.tap {|gem| pk = File.expand_path(File.join('~/.keys', 'gem-private_key.pem')); gem.signing_key = pk if File.exist? pk; gem.cert_chain = ['gem-public_cert.pem']} # pressed firmly by waxseal
