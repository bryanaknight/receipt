class Basket
  attr_accessor :line_items

  def initialize(items_string)
    @line_items = []
    item_lines = items_string.split("\n").reject { |line| line.include?("Input")}
    item_lines.each do |item_line|
      qty = item_line.split(" ").first
      item_name = item_line.split("at ").first.delete("1-9").strip
      item_price = item_line.split(" ").last
      imported = item_line.include?("imported")
      item = Item.new(item_name, item_price, imported)
      @line_items << LineItem.new(qty, item)
    end
  end

  def tax_total
    line_items.inject(0) { |total, line_item| total + line_item.sales_tax }
  end

  def total
    tax_total + subtotal
  end

  private

  def subtotal
    line_items.inject(0) {|total, line_item| total + line_item.subtotal }
  end

end