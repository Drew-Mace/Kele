Gem::Specification.new do |s|
 s.name          = 'kele'
 s.version       = '0.0.1'
 s.date          = '2017-04-28'
 s.summary       = 'Kele API Client'
 s.description   = 'A client for the Bloc API'
 s.authors       = ['Drew Mace']
 s.email         = 'dremac1@live.com'
 s.files         = ['lib/kele.rb']
 s.require_paths = ["lib"]
 s.homepage      =
   'http://rubygems.org/gems/kele'
 s.license       = 'MIT'
 s.add_runtime_dependency 'httparty', '~> 0.13'
end