require_relative 'Board'
require_relative 'Player'
require_relative 'GameHelper'

class Game
  include GameHelper

  attr_reader :code

  def initialize
    @board = Board.new
    @player = Player.new
    @code = generate_secret_code()
    @gameover = false
    @tries = 11
  end

  def start
    until @gameover
      print "#{@tries}\n"
      @tries -= 1
      @gameover = true if has_winner? || @tries < 0
    end
  end
  
  def has_winner?
    return false
  end

end
