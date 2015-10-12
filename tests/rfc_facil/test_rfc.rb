class TestRfc < Minitest::Test
  def test_rfc
    rfc = Rfc.new(name: 'Adrian Marcelo', first_last_name: 'Rangel',
                  second_last_name: 'Araujo', day: 27, month: 11, year: 1992)

    assert_equal('RAAA921127', rfc.ten_digits_code)
    assert_equal('RI', rfc.homoclave)
    assert_equal('6', rfc.verification_digit)
    assert_equal('RAAA921127RI6', rfc.to_s)
  end
end
