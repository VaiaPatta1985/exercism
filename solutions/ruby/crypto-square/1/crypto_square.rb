class Crypto
  def initialize(plaintext)
    if plaintext == ''
      @ciphertext = ''
      return
    end
    text = plaintext.downcase.scan(/[[:alnum:]]/).join
    if text.length < 2
      @ciphertext = text
      return
    end
    len = text.length
    num = (len ** 0.5).floor
    if num * (num + 1) <= len
      r = num + 1
      c = num + 1
    else
      r = num
      c = (num * num == len ? num : num + 1)
    end
    text << ' ' * (r * c - len)
    @ciphertext = (0...c).each_with_object([]){|_, cipher| cipher<<''}
    (0...c).each { |row|
      (0...r).to_a.map { |column| column * c + row}.each { |letter_index|
        @ciphertext[row] << text[letter_index]
      }
    }
    @ciphertext = @ciphertext.join(' ')
  end

  attr_accessor :ciphertext
end
