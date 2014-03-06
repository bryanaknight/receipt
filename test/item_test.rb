require 'minitest'
require 'minitest/autorun'
require_relative 'test_helper.rb'

class ItemTest < MiniTest::Unit::TestCase
  attr_reader :item1, :item2, :basket_two_item

  def setup
    basket = Basket.new("Input 1:\n1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85")
    @item1 = basket.line_items.first.item
    @item2 = basket.line_items[1].item
    basket2 = Basket.new("Input 3:\n1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n1 box of imported chocolates at 11.25\n")
    @basket_two_item = basket2.line_items.first.item
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

  def test_total_tax_for_nonexempt_items_and_nonimport_items
    assert_equal 1.50, item2.total_tax
  end

  def test_total_tax_for_exempt_and_nonimport_items
    assert_equal 0, item1.total_tax
  end

  def test_total_tax_for_import_and_nonexempt_items
    assert_equal 4.2, basket_two_item.total_tax
  end

end
