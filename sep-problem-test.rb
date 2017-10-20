require 'minitest/autorun'
require './sep-problem.rb'

class TestDiamond < MiniTest::Test

  def test_print_a
    letter = 'A'
    assert_equal 'A', Diamond.print(letter)
  end

  def test_print_c
    letter = 'C'
    assert_equal "  A\n B B\nC   C\n B B\n  A", Diamond.print(letter)
  end

  def test_should_not_accept_lowercase
    letter = 'a'
    assert_equal 'That is not a valid input, please try again.', Diamond.print(letter)
  end

  def test_should_not_accept_a_number
    letter = '1'
    assert_equal 'That is not a valid input, please try again.', Diamond.print(letter)
  end

  def test_should_not_accept_more_than_one_character
    letter = %w(AB 12 ab 35393)
    letter.each do |l|
      assert_equal 'That is not a valid input, please try again.', Diamond.print(l)
    end
  end

  def test_it_should_require_input
    letter = ''
    assert_equal 'That is not a valid input, please try again.', Diamond.print(letter)
  end

end
