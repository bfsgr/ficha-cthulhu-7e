class Stat < ApplicationRecord
    belongs_to :character
    before_save :derive


    validates :str, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :dex, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :int, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :app, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :pow, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :edu, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :con, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :siz, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }

    validate :sum_less_than_461

    private
    def sum_less_than_461
        if (str.to_i + dex.to_i + int.to_i + app.to_i + pow.to_i + edu.to_i + con.to_i + siz.to_i) > 460
            errors.add(:base, "Pontos maiores do que 460") 
        end
    end

    def derive
        self.lvl = 1
        self.luc = rand(15..90)

        if str < siz and dex < siz 
            self.mov = 7
        elsif str > siz and dex > siz
            self.mov = 9
        else
            self.mov = 8
        end
    end
end
