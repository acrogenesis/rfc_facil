class Person
  attr_accessor :name, :first_last_name, :second_last_name, :day, :month, :year

  def initialize(name, first_last_name, second_last_name, day, month, year)
    self.name = name
    self.first_last_name = first_last_name
    self.second_last_name = second_last_name
    self.day = day
    self.month = month
    self.year = year
  end

  def to_s
    "#{first_last_name} #{second_last_name} #{name}"
  end
end
