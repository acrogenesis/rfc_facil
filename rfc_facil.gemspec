# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rfc_facil/version'

Gem::Specification.new do |spec|
  spec.name          = 'rfc_facil'
  spec.version       = RfcFacil::VERSION
  spec.authors       = ['Adrian Rangel']
  spec.email         = ['adrian.rangel@gmail.com']
  spec.licenses      = ['MIT']

  spec.summary       = 'Libreria para calcular el Registro Federal de Contribuyentes en México (RFC).'
  spec.homepage      = 'https://acrogenesis.com/rfc_facil/'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'i18n', '>= 0.7.0'
  spec.add_dependency 'unicode_utils', '>= 1.4'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.8'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
end
