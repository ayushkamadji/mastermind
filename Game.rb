require_relative 'Board'
require_relative 'Player'
require_relative 'GameHelper'

class Game
  include GameHelper

  attr_accessor :code, :board # change back to reader later

  def initialize
    @board = Board.new
    @player = Player.new
    @code = generate_secret_code()
    @gameover = false
    @tries = 11
  end

  def start
    display
    until @gameover
      move = parse(@player.play)
      feedback = calculate_feedback(move)
      @board.update_row((11 - @tries), move, feedback)
      display
      @tries -= 1
      @gameover = true if has_winner? || @tries < 0
    end
    show_code
  end
  
  def has_winner?
    return @board.rows.any? do |row|
      row.feedback.all? { |fb| fb.code == :grey }
    end
  end

  def calculate_feedback(secret = @code, decode)
    feedback = []
    decode_nomatch = []
    secret_nomatch = []
    decode.each_with_index do |code, i| 
       if secret[i] == code
         feedback.push(:grey)
       else
         decode_nomatch.push(code)
         secret_nomatch.push(secret[i])
       end
    end
    decode_nomatch.each_with_index do |code, i|
      if secret_nomatch.include?(code)
        feedback.push(:white)
        secret_nomatch.delete(code)
      end
    end
    return feedback
  end

  # View
  def display
    board.display
    print "#{peg(:red)} = red\t#{peg(:blue)} = blue\t#{peg(:purple)} = purple\n"
    print "#{peg(:cyan)} = cyan\t#{peg(:green)} = green\t#{peg(:yellow)} = yellow\n"
  end

  def show_code
    @code.each { |code| print "#{peg(code)}" }
  end

end
