class VerificationDigitCalculatorTest < Minitest::Test
  def test_calculate_verification_digit
    assert_equal(verification_digit('GODE561231GR'), '8')
  end

  def verification_digit(rfc12Digit)
    VerificationDigitCalculator.new(rfc12Digit).calculate
  end
end
