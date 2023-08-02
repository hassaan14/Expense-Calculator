class Propertyrecord < ApplicationRecord
    has_many :cashrecords, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true

    def self.active
        where(status:'active')
    end
    
    def self.archived
        where(status: 'archived')
    end
    
    def active?
        status == "active"
    end
    
    def archived?
        status == "archived"
    end
end
