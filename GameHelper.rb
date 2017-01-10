module GameHelper

  def generate_secret_code
    secret_code = Array.new
    4.times do
      secret_code.push(Node.valid_codes[rand(6)])
    end
    return secret_code
  end

end
