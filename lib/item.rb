class Item
  BASE_TAX_RATE = 0.1

  attr_accessor :name, :price, :import
  alias :imported? :import

  def initialize(name, price, import)
    @name = name
    @price = price.to_f
    @import = import
  end

  def total_tax
    base_tax + import_tax
  end

  private

  def base_tax
    exempt? ? 0 : price * BASE_TAX_RATE
  end

  def import_tax
    imported? ? price * 0.05 : 0
  end

  def exempt?
    ExemptManifest.exempt?(name)
  end
end
