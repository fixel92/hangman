class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = normalized_letters(word.chars)
    @user_guesses = []
  end

  def normalized_letter(letter)
    if letter == 'Ё'
      'Е'
    elsif letter == 'Й'
      'И'
    else
      letter
    end
  end

  def normalized_letters(letters)
    letters.map { |letter| normalized_letter(letter) }
  end

  def errors
    @user_guesses - @letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    @letters.map do |letter|
      if @user_guesses.include?(normalized_letter(letter))
        normalized_letter(letter)
      else
        nil
      end
    end
  end

  def play!(letter)
    @user_guesses << letter if !over? && !@user_guesses.include?(letter)
  end

  def lost?
    errors_allowed.zero?
  end

  def over?
    won? || lost?
  end

  def won?
    (@letters - @user_guesses).empty?
  end

  def word
    @letters.join
  end
end
