# Rfc Fácil
[![Code Climate](https://codeclimate.com/github/Munett/rfc_facil/badges/gpa.svg)](https://codeclimate.com/github/Munett/rfc_facil)
[![Test Coverage](https://codeclimate.com/github/Munett/rfc_facil/badges/coverage.svg)](https://codeclimate.com/github/Munett/rfc_facil/coverage)

![](https://github.com/acrogenesis/rfc_facil/raw/master/logo.png)

Libreria para calcular el Registro Federal de Contribuyentes en México (RFC) en Ruby.

[![Build Status](https://travis-ci.org/acrogenesis/rfc_facil.svg?branch=master)](https://travis-ci.org/acrogenesis/rfc_facil)

## Uso

```ruby
gem 'rfc_facil'
```
Calcular el rfc de una persona física es muy sencillo:
```ruby
rfc = RfcFacil::Rfc.new(name: 'Adrián Marcelo', first_last_name: 'Rangel', second_last_name: 'Araujo', day: 27, month: 11, year: 1992)
rfc.to_s # => 'RAAA921127RI6'
```

## Fuente
Esta librería se basa en documentación oficial obtenida por medio del IFAI (Instituto Federal de Acceso a la Información). El documento puede ser consultado en el sitio de [INFOMEX](https://www.infomex.org.mx/gobiernofederal/moduloPublico/moduloPublico.action) con el folio 0610100135506.

### Agradecimiento
El código es una version en Ruby de [rfc-facil](https://github.com/josketres/rfc-facil) hecha en Java por [josketres](https://github.com/josketres)

## Colabora
Errores y pull requests son bienvenidos en Github: https://github.com/acrogenesis/rfc_facil.
