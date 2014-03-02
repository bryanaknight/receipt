class Rounder

  def self.round_tax(tax)
    ((tax * 20).ceil) / 20.to_f 
  end

end
