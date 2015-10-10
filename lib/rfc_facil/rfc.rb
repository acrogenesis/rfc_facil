class Rfc
  attr_accessor :name, :first_last_name, :second_last_name, :day, :month, :year,
                :ten_digits_code, :homoclave, :verification_digit

  def initialize(args)
    self.name = args[:name]
    self.first_last_name = args[:first_last_name]
    self.second_last_name = args[:second_last_name]
    self.day = args[:day]
    self.month = args[:month]
    self.year = args[:year]

    person = Person.new(name, first_last_name, second_last_name, day, month, year)
    self.ten_digits_code = TenDigitsCodeCalculator.new(person).calculate
    self.homoclave = HomoclaveCalculator.new(person).calculate
    self.verification_digit = VerificationDigitCalculator.new(ten_digits_code + homoclave).calculate
  end

  def to_s
    "#{ten_digits_code}#{homoclave}#{verification_digit}"
  end

  def birthday(day, month, year)
    self.day = day
    self.month = month
    self.year = year
  end
end
