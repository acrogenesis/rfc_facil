class TestHomoclaveCalculator < Minitest::Test
  def test_calculate_homoclave_for_simple_test_case
    assert_equal(homoclave('Juan', 'Perez', 'Garcia'), 'LN')
  end

  def test_calculate_same_homoclave_for_names_with_and_without_accents
    assert_equal(homoclave('Juan', 'Perez', 'Garcia'), homoclave('Juan', 'Pérez', 'García'))
  end

  def test_calculate_homoclave_for_person_with_more_than_one_name
    assert_equal(homoclave('Jose Antonio', 'Del real', 'Anzures'), 'N9')
  end

  def test_calculate_homoclave_for_name_with_n_with_tilde
    assert_equal(homoclave('Juan', 'Muñoz', 'Ortega'), 'T6')
  end

  def test_calculate_homoclave_for_name_with_multiple_n_with_tilde
    assert_equal(homoclave('Juan', 'Muñoz', 'Muñoz'), 'RZ')
  end

  def test_calculate_different_homoclave_for_name_with_n_with_tilde_and_without
    refute_equal(homoclave('Juan', 'Muñoz', 'Ortega'), homoclave('Juan', 'Munoz', 'Ortega'))
  end

  def test_calculate_homoclave_for_name_with_u_with_umlaut
    assert_equal(homoclave('Jesus', 'Argüelles', 'Ortega'), 'JF')
  end

  def test_calculate_same_homoclave_for_name_with_u_with_umlaut_and_without
    assert_equal(homoclave('Jesus', 'Argüelles', 'Ortega'), homoclave('Jesus', 'Arguelles', 'Ortega'))
  end

  def test_calculate_homoclave_for_name_with_ampersand
    assert_equal(homoclave('Juan', 'Perez&Gomez', 'Garcia'), '2R')
  end

  def test_calculate_same_homoclave_for_name_with_and_without_special_characters
    assert_equal(homoclave('Juan', 'Mc.Gregor', "O'Connor-Juarez"), homoclave('Juan', 'McGregor', 'OConnorJuarez'))
  end

  def test_calculate_different_homoclave_for_names_with_and_without_ampersand
    refute_equal(homoclave('Juan', 'Perez&Gomez', 'Garcia'), homoclave('Juan', 'PerezGomez', 'Garcia'))
  end

  def test_calculate_same_homoclave_for_different_birthdays
    assert_equal(
      HomoclaveCalculator.new(Person.new('Juan', 'Perez', 'Garcia', 1, 1, 1901)).calculate,
      HomoclaveCalculator.new(Person.new('Juan', 'Perez', 'Garcia', 5, 8, 1987)).calculate
    )
  end

  def homoclave(name, firstLastName, secondLastName)
    HomoclaveCalculator.new(Person.new(name, firstLastName, secondLastName, 1, 1, 1901)).calculate
  end
end
