class Character < ApplicationRecord
    belongs_to :user
    has_many :stats
    has_one :current_stat
end
