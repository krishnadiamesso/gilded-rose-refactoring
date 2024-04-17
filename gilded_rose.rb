class GildedRose

  def initialize(items)
    @items = items
  end

  def update_aged_brie(item)
    item.quality = item.quality + 1 if item.quality < 50
    item.sell_in = item.sell_in - 1 if item.name != "Sulfuras, Hand of Ragnaros"
    item.quality = item.quality + 1 if item.sell_in < 0 && item.quality < 50
  end

  def update_backstage_passes(item)
    item.quality = item.quality + 1 if item.quality < 50
    item.quality = item.quality + 1 if item.sell_in < 11 && item.quality < 50
    item.quality = item.quality + 1 if item.sell_in < 6 && item.quality < 50
    item.sell_in = item.sell_in - 1 if item.name != "Sulfuras, Hand of Ragnaros"
    item.quality = 0 if item.sell_in < 0
  end

  def update_normal_item(item)
    item.quality = item.quality - 1 if item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
    item.sell_in = item.sell_in - 1 if item.name != "Sulfuras, Hand of Ragnaros"
    if item.sell_in < 0
      item.quality = item.quality - 1 if item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
    end
  end

  def update_quality()
    @items.each do |item|

      case item.name
      when "Aged Brie"
        update_aged_brie(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        update_backstage_passes(item)
      else
        update_normal_item(item)
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
