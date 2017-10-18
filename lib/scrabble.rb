class Scrabble

  def score(word)
    @score = []
    if word == nil || word == ""
        return 0
    else
      @word = word.upcase.split('')
      @word.map do |i|
        point_values.each do |key, value|
         @score << value if i == key
        end
      end
     @score.sum
    end
  end

def score_with_multipliers(word, multiplier =1, word_multi = 1 )
  multi = []
  multi << 10 if word.length >6
  score(word)
    @score.each_with_index do |x,i|
       multi.push(x * multiplier[i])
    end
  multi = multi.sum * word_multi
end

def highest_scoring_word(words)
   max_score = {}
   word_length = []
     words.each do |word|
       max_score[word] = score(word)
     end
     max_score.each do |k,v|
       if v == max_score.max_by{|key,value| value}.pop
        word_length <<  k
       end
     end
  word_length.sort_by {|x| x.length}.shift
end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

end
game = Scrabble.new
# s.score("hello")
game.highest_scoring_word([ 'word', 'hello', 'sound'])
