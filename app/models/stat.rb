class Stat < ApplicationRecord
    belongs_to :character
    before_save :derive, :sum_less_than_461

    validates :str, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :dex, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :int, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :app, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :pow, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :edu, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :con, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }
    validates :siz, :presence => true,  numericality: { only_integer: true, less_than: 91, greater_than: 14 }

    def improve_edu
        val = rand(1..100)
        if val > edu.to_i
            d10 = rand(1..10)
            new_edu = d10 + edu.to_i
            if new_edu > 99
                self.edu = 99
            else 
                self.edu = new_edu
            end
        end
    end

    
    private
    def gen_luck(advantage)
        t1 = rand(15..90)
        if advantage
            t2 = rand(15..90)
            self.luc = [t1, t2].max
        else
            self.luc = t1
        end
    end
    
    def sum_less_than_461
        if (str.to_i + dex.to_i + int.to_i + app.to_i + pow.to_i + edu.to_i + con.to_i + siz.to_i) > 460
            errors.add(:base, "Pontos maiores do que 460") 
        end
    end

    def derive
        self.lvl = 1

        if age < 20
            gen_luck(true)
        else
            gen_luck(false)
        end

        gen_mov()
        gen_dx_body()
    end


    def gen_mov
        if str < siz and dex < siz 
            self.mov = 7
        elsif str > siz and dex > siz
            self.mov = 9
        else
            self.mov = 8
        end
    end

    def gen_dx_body
        mod = str.to_i + siz.to_i

        case mod
        when 2..64
            self.dx = '-2'
            self.body = '-2'
        when 65..84
            self.dx = '-1'
            self.body = '-1'
        when 85..124
            self.dx = '0'
            self.body = '0'
        when 125..164
            self.dx = '1d4'
            self.body = '1'
        when 165..204
            self.dx = '1d6'
            self.body = '2'
        when 205..284
            self.dx = '2d6'
            self.body = '3'
        else
            self.dx = '3d6'
            self.body = '4'
        end
    end
end
