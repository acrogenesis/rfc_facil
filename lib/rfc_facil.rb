require 'rfc_facil/version'
require 'rfc_facil/homoclave_calculator'
require 'rfc_facil/natural_person'
require 'rfc_facil/juristic_person'
require 'rfc_facil/rfc'
require 'rfc_facil/natural_ten_digits_code_calculator'
require 'rfc_facil/juristic_ten_digits_code_calculator'
require 'rfc_facil/verification_digit_calculator'
require 'i18n'
require 'unicode_utils/upcase'
module RfcFacil
  I18n.available_locales = :en
end
