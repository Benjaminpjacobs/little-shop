class Cart
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def total_count
    @contents.values.sum
  end

  def update_quantity(item_id)
    @contents[item_id.to_s] = (contents[item_id.to_s] || 0) + 1
  end

  def quantity_for(item_id)
    contents[item_id.to_s]
  end

  def total_price
    sum = 0
    # .reduce(0) do |sum, (item_id, quantity)|
    @contents.each do |item_id, quantity|
      item = Item.find(item_id)
      sum += item.price*quantity
    end
    sum
  end
end