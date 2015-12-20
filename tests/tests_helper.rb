require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'minitest/autorun'
require_relative '../lib/rfc_facil'
require 'rfc_facil/test_homoclave_calculator'
require 'rfc_facil/test_rfc'
require 'rfc_facil/test_natural_ten_digits_code_calculator'
require 'rfc_facil/test_juristic_ten_digits_code_calculator'
require 'rfc_facil/test_verification_digit_calculator'
