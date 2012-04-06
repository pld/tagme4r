s = Gem::Specification.new do |s|
  s.name         = 'tagme4r'
  s.version      = '0.0.1'
  s.date         = '2012-04-05'
  s.summary      = 'API for TAGME'
  s.description  = 'API for TAGME'
  s.authors      = ['Peter Lubell-Doughtie']
  s.email        = 'peter@helioid.com'
  s.files        = ['lib/tagme.rb']
  s.homepage     = 'http://www.helioid.com/'
end

s.add_dependency('nokogiri')
s
