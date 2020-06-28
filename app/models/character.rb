class Character < ApplicationRecord
    belongs_to :user
    has_many :stats
    has_one :current_stat

    validates :name, :presence => true, :length => { :in => 3..50 }
    validates :ocupation, :presence => true, numericality: { only_integer: true, less_than: 28, greater_than_or_equal_to: 0 }
    validates :birth_place, :presence => true
    validates :age, :presence => true
    validates :sex, :presence => true
    

    def self.ocupations 
        
    end
end
