module TwelveDays
    AND = 'and '
    COMMA = ', '
    END_VERSE = ".\n"
    CHANGE_VERSE = "\n"
    INTRO = 'On the %<day_order>s day of Christmas my true love gave to me: '
    PRESENTS = {
      'first' => '%<and_or_nothing>sa Partridge in a Pear Tree',
      'second' => 'two Turtle Doves',
      'third' => 'three French Hens',
      'fourth' => 'four Calling Birds',
      'fifth' => 'five Gold Rings',
      'sixth' => 'six Geese-a-Laying',
      'seventh' => 'seven Swans-a-Swimming',
      'eighth' => 'eight Maids-a-Milking',
      'ninth' => 'nine Ladies Dancing',
      'tenth' => 'ten Lords-a-Leaping',
      'eleventh' => 'eleven Pipers Piping',
      'twelfth' => 'twelve Drummers Drumming'
    }

  def self.song
    verses = []
    presents = []
    PRESENTS.each { | day_order, present |
      and_or_nothing = day_order == 'first' ? '' : AND
      presents << present
      verses << INTRO % {day_order:} + \
                presents.reverse.join(COMMA) % {and_or_nothing:} + \
                END_VERSE
    }
    verses.join(CHANGE_VERSE)
  end

end
