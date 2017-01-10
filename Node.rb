require_relative 'ViewHelper'

class Node
  include ViewHelper

  attr_reader :code

  def initialize(code = :blank)
    @code = code
    @valid_codes = [:blank]
  end
  
  def is_blank?
    return @code == :blank
  end

  def update_code(code)
    return print "Color not recognized" unless @valid_codes.include?(code)
    @code = code
  end

  def self.valid_codes
    return @valid_codes
  end

end

class DecodingNode < Node

  def initialize(code = :blank)
    @code = code
    @valid_codes = [:blue, :red, :green, :purple, :yellow, :pink]
  end

  def display
    print ViewHelper::dpeg(@code)
    return nil
  end

end

class FeedbackNode < Node

  def initialize(code = :blank)
    @code = code
    @valid_codes = [:grey, :white]
  end

  def display
    print ViewHelper::fpeg(@code)
    return nil
  end
  
end
