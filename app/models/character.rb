class Character < ApplicationRecord
    belongs_to :user
    has_many :stats
    has_one :current_stat

    validates :name, :presence => true, :length => { :in => 3..50 }
    validates :ocupation, :presence => true
    validates :scholarity, :presence => true
    validates :birth_place, :presence => true
    validates :age, :presence => true
    validates :sex, :presence => true
    
    validates_length_of :password, :in => 6..255, :on => :create

    def self.ocupations 
        
    end
end
