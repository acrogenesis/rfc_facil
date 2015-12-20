class TestJurisitcTenDigitsCodeCalculator < Minitest::Test
  def should_take_first_letters_from_the_first_three_words_from_legal_name
    assert_equal('MNE', ten_digits_code('Mu Networks S.A.P.I. de C.V.', 10, 07, 2014)[0, 3])
  end

  def should_take_creation_date_in_format_yy_mm_dd
    assert_equal('MNE1407107', ten_digits_code('Mu Networks S.A.P.I. de C.V.', 10, 07, 2014))
  end

  private

  def ten_digits_code(legal_name, day, month, year)
    JuristicTenDigitsCodeCalculator.new(
      JuristicPerson.new(legal_name, day, month, year)
    ).calculate
  end
end
