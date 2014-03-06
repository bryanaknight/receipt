class Item
  BASE_TAX_RATE = 0.1
  IMPORT_TAX_RATE = 0.05

  attr_accessor :name, :price, :import
  alias :imported? :import

  def initialize(name, price, import)
    @name = name
    @price = price.to_f
    @import = import
  end

  def total_tax
    Rounder.round_tax(base_tax + import_tax)
  end

  private

  def base_tax
    tax = exempt? ? 0 : price * BASE_TAX_RATE
    Rounder.round_tax(tax)
  end

  def import_tax
    tax = imported? ? price * IMPORT_TAX_RATE : 0
    Rounder.round_tax(tax)
  end

  def exempt?
    ExemptManifest.exempt?(name)
  end
end
