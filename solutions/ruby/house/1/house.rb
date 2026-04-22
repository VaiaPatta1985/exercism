module House
  WHO_DID_WHAT = [
    {item: 'house that Jack built.', verb: ''},
    {item: 'malt', verb: 'lay in'},
    {item: 'rat', verb: 'ate'},
    {item: 'cat', verb: 'killed'},
    {item: 'dog', verb: 'worried'},
    {item: 'cow with the crumpled horn', verb: 'tossed'},
    {item: 'maiden all forlorn', verb: 'milked'},
    {item: 'man all tattered and torn', verb: 'kissed'},
    {item: 'priest all shaven and shorn', verb: 'married'},
    {item: 'rooster that crowed in the morn', verb: 'woke'},
    {item: 'farmer sowing his corn', verb: 'kept'},
    {item: 'horse and the hound and the horn', verb: 'belonged to'},
  ]
  INTRO = 'This is the %<item>s'
  POEM_LINE = 'that %<verb>s the %<noun>s'
  
  def self.recite(start_verse, end_verse)
    poem = (start_verse - 1..end_verse - 1).to_a.each_with_object('') { |end_line_num, verses|
      verse0 = []
      verse0 << INTRO % {item: WHO_DID_WHAT[end_line_num][:item]}
      if end_line_num != 0 then
        verses << (1..end_line_num).to_a.reverse.each_with_object(verse0) { |line_num, verse|
          verse << POEM_LINE % {verb: WHO_DID_WHAT[line_num][:verb], noun: WHO_DID_WHAT[line_num - 1][:item]}
        }.join(' ') + "\n"
      else
        verses << verse0[0] + "\n"
      end
    }

  end

end