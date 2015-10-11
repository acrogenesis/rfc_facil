class Person
  attr_accessor :name, :first_last_name, :second_last_name, :day, :month, :year

  def initialize(name, first_last_name, second_last_name, day, month, year)
    @name = name
    @first_last_name = first_last_name
    @second_last_name = second_last_name
    @day = day
    @month = month
    @year = year
  end

  def to_s
    "#{@first_last_name} #{@second_last_name} #{@name}"
  end
end
