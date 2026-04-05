TwoFer = ''

def TwoFer.two_fer(name = 'you')
  twofer_phrasing = 'One for %<name>s, one for me.'
  phrase = twofer_phrasing % {name: name}
end
