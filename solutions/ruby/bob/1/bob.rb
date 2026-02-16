module Bob
  def self.hey(sentence)
    if sentence.strip == ''
      'Fine. Be that way!'
    elsif sentence.strip[-1] == '?'
      if sentence == sentence.upcase and sentence != sentence.downcase
        'Calm down, I know what I\'m doing!'
      else
        'Sure.'
      end
    elsif sentence == sentence.upcase and sentence != sentence.downcase
      'Whoa, chill out!'
    else
      'Whatever.'
    end
  end

end