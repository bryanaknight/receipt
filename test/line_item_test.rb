require 'minitest'
require 'minitest/autorun'
require_relative 'test_helper.rb'

class LineItemTest < MiniTest::Unit::TestCase
  attr_reader :line_items

  def setup
    basket = Basket.new("Input 1:\n1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85")
    @line_items = basket.line_items
  end

  def test_line_items_have_quantity
    line_items.each do |line_item|
      assert line_item.quantity > 0
    end
  end

end
