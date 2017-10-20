ALPHABET = Array('A'..'Z')

class Diamond

  def self.print(letter)
    unless ALPHABET.include? letter
      puts 'That is not a valid input, please try again.'
      exit
    end
    if letter == 'A'
      diamond = letter
    else
      letters = Array('A'..letter) + Array('A'...letter).reverse
      reverse = Array('A'..letter).reverse
      diamond = letters.map do |l|
        place = reverse.index(l)
        leading_spaces = ' ' * place
        leading_spaces + LetterRow.new(l).to_s
      end.join("\n")
    end
    diamond
  end
end

class LetterRow
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def middle_spaces
    return if @letter == 'A'
    spaces = ALPHABET.index(@letter) * 2 - 1
    ' ' * spaces
  end

  def to_s
    if @letter == 'A'
      letter
    else
      [letter, middle_spaces, letter].join
    end
  end
end


# 0  ....A....
# 1  ...B.B...
# 2  ..C...C..
# 3  .D.....D.
# 4  E.......E
#
# E array.length == 5
# [0]A = 4 leading spaces
# [1]B = 3
# [2]C = 2
# [3]D = 1
# [4]E = 0
