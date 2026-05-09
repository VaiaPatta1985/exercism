Item = Struct.new(:sell_in, :quality, :name)

class GildedRose
  CONJURED_PREFIX_LOWERCASE = 'conjured '
  LEGENDARY = ['sulfuras, hand of ragnaros']

  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      conjured = (item.name.downcase[0...CONJURED_PREFIX_LOWERCASE.length] == CONJURED_PREFIX_LOWERCASE)
      name = conjured ? item.name[CONJURED_PREFIX_LOWERCASE.length..-1].downcase : item.name.downcase
      past_due_date = (!(item.sell_in.nil?) && item.sell_in <= 0)
      case name
      when "aged brie"
        item.quality += (past_due_date ? 2 : 1)
        item.quality = 50 if item.quality > 50
      when "backstage passes to a tafkal80etc concert"
        quality_increase = (conjured ? 0 : 1)
        quality_increase += 1 if item.sell_in <= 10
        quality_increase += 1 if item.sell_in <= 5
        item.quality += quality_increase
        item.quality = 0 if past_due_date
        item.quality = 50 if item.quality > 50
      when *LEGENDARY
        item.sell_in += 1 unless conjured
      else
        item.quality -= (conjured || past_due_date ? 2 : 1)
      end
      item.quality = 0 if item.quality < 0 || (conjured && past_due_date)
      item.sell_in -= 1 unless item.sell_in.nil?
    end
  end
end
