class ExemptManifest

  EXEMPT_CATEGORIES = ["book", "books", "chocolate", "chocolates", "pills", "headache"]

  def self.exempt?(item_name)
    EXEMPT_CATEGORIES.include?(item_name)
  end

end
