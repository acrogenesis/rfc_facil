class JuristicTenDigitsCodeCalculator
  attr_accessor :person

  def initialize(person)
    @person = person
  end

  def calculate
    words = person.legal_name.split('\\s')
    "#{words[0][0]}#{words[1][0]}#{words[2][0]}-#{birthday_code}"
  end

  def birthday_code
    "#{last_two_digits_of(person.year)}#{formatted_in_two_digits(person.month)}#{formatted_in_two_digits(person.day)}"
  end

  def formatted_in_two_digits(number)
    format('%02d', number)
  end

  def last_two_digits_of(number)
    formatted_in_two_digits(number % 100)
  end
end
