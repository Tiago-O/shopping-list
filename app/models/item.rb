class Item < ApplicationRecord
  belongs_to :list

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
