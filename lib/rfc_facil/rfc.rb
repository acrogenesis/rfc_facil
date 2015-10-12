class Rfc
  attr_accessor :name, :first_last_name, :second_last_name, :day, :month, :year,
                :ten_digits_code, :homoclave, :verification_digit

  def initialize(args)
    @name = args[:name]
    @first_last_name = args[:first_last_name]
    @second_last_name = args[:second_last_name]
    @day = args[:day]
    @month = args[:month]
    @year = args[:year]

    @person = Person.new(@name, @first_last_name, @second_last_name, @day, @month, @year)
    @ten_digits_code = TenDigitsCodeCalculator.new(@person).calculate
    @homoclave = HomoclaveCalculator.new(@person).calculate
    @verification_digit = VerificationDigitCalculator.new("#{@ten_digits_code}#{@homoclave}").calculate
  end

  def to_s
    "#{@ten_digits_code}#{@homoclave}#{@verification_digit}"
  end
end
