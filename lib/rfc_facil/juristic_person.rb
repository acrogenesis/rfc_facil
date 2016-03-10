module RfcFacil
  class JuristicPerson
    attr_accessor :legal_name, :day, :month, :year

    def initialize(legal_name, day, month, year)
      @legal_name = legal_name
      @day = day
      @month = month
      @year = year
    end
  end
end
