class TestRfc < Minitest::Test
  def test_rfc_for_a_natural_person
    rfc = RfcFacil::Rfc.new(name: 'Adrian Marcelo', first_last_name: 'Rangel',
                  second_last_name: 'Araujo', day: 27, month: 11, year: 1992)

    assert_equal('RAAA921127', rfc.ten_digits_code)
    assert_equal('RI', rfc.homoclave)
    assert_equal('6', rfc.verification_digit)
    assert_equal('RAAA921127RI6', rfc.to_s)

    rfc = RfcFacil::Rfc.new(name: 'ELIUD', first_last_name: 'OROZCO',
                  second_last_name: 'GOMEZ', day: 11, month: 7, year: 1952)

    assert_equal('OOGE520711', rfc.ten_digits_code)
    assert_equal('15', rfc.homoclave)
    assert_equal('1', rfc.verification_digit)
    assert_equal('OOGE520711151', rfc.to_s)

    rfc = RfcFacil::Rfc.new(name: 'SATURNINA', first_last_name: 'ANGEL',
                  second_last_name: 'CRUZ', day: 12, month: 11, year: 1921)

    assert_equal('AECS211112', rfc.ten_digits_code)
    assert_equal('JP', rfc.homoclave)
    assert_equal('A', rfc.verification_digit)
    assert_equal('AECS211112JPA', rfc.to_s)
  end

  def test_rfc_for_a_juristic_person
    _rfc = RfcFacil::Rfc.new(legal_name: 'Mu Networks S.A.P.I de C.V.', day: 10, month: 07, year: 2014)

    # assert_equal('MNE140710', rfc.ten_digits_code)
    # assert_equal('7G', rfc.homoclave)
    # assert_equal('8', rfc.verification_digit)
    # assert_equal('MNE1407107G8', rfc.to_s)
  end
end
