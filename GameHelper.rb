require_relative 'ViewHelper'

module GameHelper

  def generate_secret_code
    secret_code = Array.new
    4.times do
      secret_code.push(DecodingNode.valid_codes[rand(6)])
    end
    return secret_code
  end

  def peg(code)
    ViewHelper::dpeg(code)
  end

  def parse(code_string)
    return code_string.split(" ").collect { |code| code.to_sym }
  end

end
