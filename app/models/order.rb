class Order < ActiveRecord::Base
  validates :user_id, presence: true
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates_with EnoughProductsValidator

  belongs_to :user
  has_many :placements
  has_many :products, through: :placements

  before_validation :set_total!

  def set_total!
    self.total = placements.map { |placement| placement.product.price * placement.quantity }.sum
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities = [])
    product_ids_and_quantities.each do |product_ids_and_quantity|
      id, quantity = product_ids_and_quantity
      self.placements.build(product_id: id, quantity: quantity)
    end
  end
end
