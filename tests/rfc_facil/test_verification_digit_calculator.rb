class VerificationDigitCalculatorTest < Minitest::Test
  def test_calculate_verification_digit
    assert_equal('8', verification_digit('GODE561231GR'))
  end

  def verification_digit(rfc12Digit)
    RfcFacil::VerificationDigitCalculator.new(rfc12Digit).calculate
  end
end
