class Propertyrecord < ApplicationRecord
    has_many :cashrecords

    validates :name, presence: true
    validates :description, presence: true
end
