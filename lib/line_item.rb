class LineItem
  attr_accessor :item, :quantity

  def initialize(quantity, item)
    @quantity = quantity.to_i
    @item = item
  end

  def sales_tax
    item.total_tax * quantity
  end

  def subtotal
    item.price * quantity
  end

end
