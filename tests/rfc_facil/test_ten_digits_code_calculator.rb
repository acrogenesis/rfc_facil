class TestTenDigitsCodeCalculator < Minitest::Test
  def test_calculate_ten_digits_code_for_simple_test_case
    assert_equal('BAFJ701213', ten_digits_code('Juan', 'Barrios', 'Fernandez', 13, 12, 1970))
  end

  def test_calculate_ten_digits_code_for_date_after_year_2000
    assert_equal('BAFJ011201', ten_digits_code('Juan', 'Barrios', 'Fernandez', 1, 12, 2001))
  end

  def test_exclude_special_particles_in_both_last_names
    # DE, LA, LAS, MC, VON, DEL, LOS, Y, MAC, VAN, MI
    assert_equal('GEJE701213', ten_digits_code('Eric', 'Mc Gregor', 'Von Juarez', 13, 12, 1970))
  end

  def test_exclude_special_particles_in_the_first_last_name
    assert_equal('ZATJ701213', ten_digits_code('Josue', 'Zarzosa', 'de la Torre', 13, 12, 1970))
  end

  def test_exclude_special_particles_in_the_second_last_name
    assert_equal('TOZJ701213', ten_digits_code('Josue', 'de la Torre', 'Zarzosa', 13, 12, 1970))
  end

  def test_use_first_word_of_compound_second_last_name
    assert_equal('JIPA701213', ten_digits_code('Antonio', 'Jiménez', 'Ponce de León', 13, 12, 1970))
  end

  def test_use_first_word_of_compound_first_last_name
    assert_equal('POJA701213', ten_digits_code('Antonio', 'Ponce de León', 'Juarez', 13, 12, 1970))
  end

  def test_use_use_first_two_letters_of_first_name_if_first_last_name_has_just_one_letter
    assert_equal('OLAL701213', ten_digits_code('Alvaro', 'de la O', 'Lozano', 13, 12, 1970))
  end

  def test_use_use_first_two_letters_of_first_name_if_first_last_name_has_just_two_letters
    assert_equal('ERER701213', ten_digits_code('Ernesto', 'Ek', 'Rivera', 13, 12, 1970))
  end

  def test_use_first_name_if_person_has_multiple_names
    assert_equal('FEJL701213', ten_digits_code('Luz María', 'Fernández', 'Juárez', 13, 12, 1970))
  end

  def test_use_second_name_if_person_has_multiple_names_and_first_name_is_jose
    assert_equal('CAHA701213', ten_digits_code('José Antonio', 'Camargo', 'Hernández', 13, 12, 1970))
  end

  def test_use_second_name_if_person_has_multiple_names_and_first_name_is_maria
    assert_equal('RASL701213', ten_digits_code('María Luisa', 'Ramírez', 'Sánchez', 13, 12, 1970))
  end

  def test_use_first_two_letters_of_second_last_name_if_empty_first_last_name_is_provided
    assert_equal('MAJU701213', ten_digits_code('Juan', '', 'Martínez', 13, 12, 1970))
  end

  def test_use_first_two_letters_of_second_last_name_if_nil_first_last_name_is_provided
    assert_equal('MAJU701213', ten_digits_code('Juan', nil, 'Martínez', 13, 12, 1970))
  end

  def test_use_first_two_letters_of_first_last_name_if_empty_second_last_name_is_provided
    assert_equal('ZAGE701213', ten_digits_code('Gerarda', 'Zafra', '', 13, 12, 1970))
  end

  def test_use_first_two_letters_of_first_last_name_if_nil_second_last_name_is_provided
    assert_equal('ZAGE701213', ten_digits_code('Gerarda', 'Zafra', nil, 13, 12, 1970))
  end

  def test_replace_last_letter_with_x_if_code_makes_forbidden_word
    # BUEI -> BUEX
    assert_equal('BUEX701213', ten_digits_code('Ingrid', 'Bueno', 'Ezquerra', 13, 12, 1970))
  end

  private

  def ten_digits_code(name, first_last_name, second_last_name, day, month, year)
    TenDigitsCodeCalculator.new(
      Person.new(name, first_last_name, second_last_name, day, month, year)
    ).calculate
  end
end
