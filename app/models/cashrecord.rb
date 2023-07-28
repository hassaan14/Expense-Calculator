class Cashrecord < ApplicationRecord
  belongs_to :propertyrecord, optional: true

  validates :amount, presence: true
end
