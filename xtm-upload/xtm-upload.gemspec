Gem::Specification.new do |s|
  s.name        = 'xtm-upload'
  s.version     = '0.0.1'
  s.date        = '2019-04-28'
  s.summary     = "XTM upload"
  s.description = "Upload files to XTM"
  s.authors     = ["ehom"]
  s.email       = 'erwin.hom@puppet.com'
  s.files       = [ 'lib/xtm-upload.rb', 'lib/xtm-upload/upload-file-service.rb', 
    'lib/xtm-upload/get-project-status-service.rb', 'lib/xtm-upload/xtm-service-config.rb' ]
  s.homepage    = 'https://ehom.github.io/xtm-helper/'
  s.license       = 'MIT'
end
