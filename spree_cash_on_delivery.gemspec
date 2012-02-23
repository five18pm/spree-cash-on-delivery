# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_cash_on_delivery'
  s.version     = '0.1.0'
  s.summary     = 'Spree Cash On Delivery payment method for countries which provide goods and then collect cash'
  s.description = 'In countries like India, one of the popular payment model is to collect cash while delivering goods. This extension adds COD payment method to Spree'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Chandramohan Rangaswamy'
  s.email             = 'chandru@simplelife.in'
  s.homepage          = 'http://www.simplelife.in/'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 1.0.0'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'
end
