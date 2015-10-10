require 'minitest/autorun'
require_relative '../../lib/rfc_facil'
class RfcTest
  def should_build_rfc
    Rfc.new(name: 'Adrian Marcelo', first_last_name: 'Rangel',
            second_last_name: 'Araujo', day: 27, month: 11, year: 1992)

    assert_equal(rfc.ten_digits_code, 'RAAA921127')
    assert_equal(rfc.homoclave, 'RI')
    assert_equal(rfc.verification_digit, '6')
    assert_equal(rfc.to_s, 'RAAA921127RI6')
  end
end
