class ReceiptFormatter

  def self.format_receipt(basket) #qty, name, price + tax, all_taxes total, grand total)
    basket.line_items.each do |line_item|
      puts "#{line_item.quantity} #{line_item.item.name} at #{line_item.item.price}"
    end
    puts "Sales Taxes: #{basket.tax_total}"
    puts "Total: #{basket.total}"
  end

end
