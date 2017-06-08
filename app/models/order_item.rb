class OrderItem < ApplicationRecord
  validates :qty, presence: true
  
  belongs_to :order
  belongs_to :item

  before_create :calculate_subtotal
  
  private
      
    def calculate_subtotal
      self.line_item_subtotal = self.item.price * qty
    end
end