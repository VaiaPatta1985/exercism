TwoFer = 'One for %<name>s, one for me.'

def TwoFer.two_fer(name = 'you')
  self % {name:}
end

def TwoFer.two_fer0(name = 'you')
  self % Hash[local_variables.map { |v| [v, eval(v.to_s)] }]
end
