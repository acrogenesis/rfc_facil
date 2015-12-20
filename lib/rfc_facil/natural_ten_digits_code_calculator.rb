class NaturalTenDigitsCodeCalculator
  VOWEL_PATTERN = /[AEIOU]+/
  attr_accessor :person
  SPECIAL_PARTICLES = %w(DE LA LAS MC VON DEL LOS Y MAC VAN MI)
  FORBIDDEN_WORDS = %w(
    BUEI BUEY CACA CACO CAGA KOGE KAKA MAME KOJO KULO
    CAGO COGE COJE COJO FETO JOTO KACO KAGO MAMO MEAR MEON
    MION MOCO MULA PEDA PEDO PENE PUTA PUTO QULO RATA RUIN
  )

  def initialize(person)
    @person = person
  end

  def calculate
    "#{obfuscate_forbidden_words(name_code)}#{birthday_code}"
  end

  def obfuscate_forbidden_words(name_code)
    FORBIDDEN_WORDS.each do |forbidden|
      return "#{name_code[0..2]}X" if forbidden == name_code
    end
    name_code
  end

  def name_code
    return first_last_name_empty_form if first_last_name_empty?
    return second_last_name_empty_form if second_last_name_empty?
    return first_last_name_too_short_form if first_last_name_is_too_short?
    normal_form
  end

  def second_last_name_empty_form
    first_two_letters_of(@person.first_last_name) <<
      first_two_letters_of(filter_name(@person.name))
  end

  def birthday_code
    "#{@person.year.to_s[-2, 2]}#{format('%02d', @person.month)}#{format('%02d', @person.day)}"
  end

  def second_last_name_empty?
    normalize(@person.second_last_name).nil? || normalize(@person.second_last_name).empty?
  end

  def first_last_name_empty_form
    first_two_letters_of(@person.second_last_name) <<
      first_two_letters_of(filter_name(@person.name))
  end

  def first_last_name_empty?
    normalize(@person.first_last_name).nil? || normalize(@person.first_last_name).empty?
  end

  def first_last_name_too_short_form
    first_letter_of(@person.first_last_name) <<
      first_letter_of(@person.second_last_name) <<
      first_two_letters_of(filter_name(@person.name))
  end

  def first_two_letters_of(word)
    normalized_word = normalize(word)
    normalized_word[0..1]
  end

  def first_last_name_is_too_short?
    normalize(@person.first_last_name).length <= 2
  end

  def normal_form
    first_letter_of(@person.first_last_name) <<
      first_vowel_excluding_first_character_of(@person.first_last_name) <<
      first_letter_of(@person.second_last_name) <<
      first_letter_of(filter_name(@person.name))
  end

  def filter_name(name)
    raw_name = normalize(name).strip
    if raw_name.include?(' ') && (raw_name.start_with?('MARIA') || raw_name.start_with?('JOSE'))
      return raw_name.split(' ')[1]
    end
    name
  end

  def formatted_in_two_digits(number)
    format('%02d', number)
  end

  def last_two_digits_of(number)
    formatted_in_two_digits(number % 100)
  end

  def first_letter_of(word)
    normalized_word = normalize(word)
    normalized_word[0]
  end

  def normalize(word)
    return word if word.nil? || word.empty?
    normalized_word = UnicodeUtils.upcase(I18n.transliterate(word))
    remove_special_particles(normalized_word, SPECIAL_PARTICLES)
  end

  def remove_special_particles(word, special_particles)
    new_word = word
    special_particles.each do |particle|
      pp = "#{particle} "
      while new_word.include?(pp)
        i = new_word.to_s.index(pp).to_i
        new_word.slice!(i..i + pp.length - 1)
      end
    end
    new_word.to_s
  end

  def first_vowel_excluding_first_character_of(word)
    normalized_word = normalize(word)[1..-1]
    m = VOWEL_PATTERN.match(normalized_word)
    fail ArgumentError, "Word doesn't contain a vowel: #{normalized_word}" if m.nil?
    normalized_word[m.to_s[0]]
  end
end
