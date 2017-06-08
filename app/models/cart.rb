class Cart
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def total_count
    @contents.values.sum
  end

  def add_to_cart(item_id)
    @contents[item_id.to_s] = (contents[item_id.to_s] || 0) + 1
  end

  def quantity_for(item_id)
    contents[item_id.to_s]
  end

  def total_price
    @contents.reduce(0) do |sum, (item_id, quantity)|
      item = Item.find(item_id)
      sum += item.price*quantity
    end
  end

  def remove_item(item_id, qty=0)
    @contents.delete(item_id.to_s)
    contents
  end

  def update_quantity(id, qty)
    @contents[id] = qty
  end
end