class Proverb
  SAYING_LINE = 'For want of a %<small_thing>s the %<big_thing>s was lost.'
  LAST_LINE = 'And all for the want of a %<qualifier>s%<first_thing>s.'

  def initialize(*things, qualifier: '')
    @saying = ''
    last_line = ''
    if things != [] then
      first_thing = things[0]
      qualifier << ' ' if qualifier != ''
      last_line << LAST_LINE % {qualifier:, first_thing:}
      if things.size > 1 then
        small_thing = ''
        @saying = things.each_with_object(''){ |big_thing, saying|
          saying << SAYING_LINE % {small_thing:, big_thing:} + "\n" unless big_thing == first_thing
          small_thing = big_thing
        }
      end
      @saying << last_line
    end  

  end

  def to_s
    @saying
  end

end