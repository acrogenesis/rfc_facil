class TestRfc < Minitest::Test
  def test_rfc_for_a_natural_person
    rfc = Rfc.new(name: 'Adrian Marcelo', first_last_name: 'Rangel',
                  second_last_name: 'Araujo', day: 27, month: 11, year: 1992)

    assert_equal('RAAA921127', rfc.ten_digits_code)
    assert_equal('RI', rfc.homoclave)
    assert_equal('6', rfc.verification_digit)
    assert_equal('RAAA921127RI6', rfc.to_s)
  end

  def test_rfc_for_a_juristic_person
    _rfc = Rfc.new(legal_name: 'Mu Networks S.A.P.I de C.V.', day: 10, month: 07, year: 2014)

    # assertThat(rfc.tenDigitsCode, equalTo("SIA-821129"));
    # assertThat(rfc.homoclave, equalTo("CK"));
    # assertThat(rfc.verificationDigit, equalTo("6"));
    # assertThat(rfc.toString(), equalTo("ZATJ870805CK6"));
  end
end
