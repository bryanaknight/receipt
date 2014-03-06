require 'minitest'
require 'minitest/autorun'
require_relative 'test_helper.rb'

class BasketTest < MiniTest::Unit::TestCase
  attr_reader :basket

  def setup
    @basket = Basket.new("Input 1:\n1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85")
  end

  def test_basket_has_line_items
    basket = Basket.new("Input 1:\n1 book at 12.49\n1 music CD at 14.99\n1 chocolate bar at 0.85")
    assert_equal 3, basket.line_items.count
  end

  def test_basket_total
    assert_equal 29.83, basket.total
  end

end
