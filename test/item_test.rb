require 'minitest'
require 'minitest/autorun'
require_relative 'test_helper.rb'

class ItemTest < MiniTest::Unit::TestCase
  attr_reader :item1

  def setup
    basket = Basket.new("Input 1:\n1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85")
    @item1 = basket.line_items.first.item
  end

  def test_item_has_name
    assert_equal "book", item1.name
  end

  def test_item_has_price
    assert_equal 12.49, item1.price
  end

  def test_item_is_import
    refute item1.import
  end

end
