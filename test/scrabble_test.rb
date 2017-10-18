gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
# require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end
  def test_it_can_score_nothing

    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_a_word

    assert_equal 8, Scrabble.new.score("hello")
  end

  def test_it_can_score_with_letter_multipliers

    assert_equal 9, Scrabble.new.score_with_multipliers("hello", [1,2,1,1,1])
  end

  def test_it_can_score_with_word_multipliers
    game = Scrabble.new

    assert_equal 39, game.score_with_multipliers("hello", [1,2,5,1,1],3)
    assert_equal 18, game.score_with_multipliers("hello", [1,2,1,1,1],2)

  end
  
  def test_it_can_score_get_7_letter_bonus
    game = Scrabble.new

    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    assert_equal 18, game.score_with_multipliers("hello", [1,2,1,1,1],2)
  end

  def test_it_can_get_highest_scoring_word
    game = Scrabble.new
    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end
  def test_it_can_get_highest_scoring_word_with_smallest_letters
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['word', 'hello', 'sound'])
  end


end
