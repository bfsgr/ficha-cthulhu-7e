class Character < ApplicationRecord
    def self.ocupations 
        [
            "Advogado",
            "Andarilho",
            "Antiquário",
            "Artista",
            "Atleta",
            "Autor",
            "Bibliotecário",
            "Membro do clero",
            "Criminoso",
            "Detetive particular",
            "Diletante",
            "Engenheiro",
            "Fanático",
            "Fazendeiro",
            "Hacker",
            "Investigador de polícia",
            "Jornalista",
            "Médico",
            "Membro de tribo",
            "Missionário",
            "Músico",
            "Oficial de polícia",
            "Oficial militar",
            "Parapsicólogo",
            "Piloto",
            "Professor",
            "Profissional do entretenimento",
            "Soldado"
        ]
    end

    belongs_to :user
    has_one :stat
    has_one :current_stat

    validates :name, :presence => true, :length => { :in => 3..50 }
    validates :ocupation, :presence => true, numericality: { only_integer: true, less_than: 28, greater_than: -1 }
    validates :birth_place, :presence => true
    validates :age, :presence => true, numericality: { only_integer: true, greater_than: 17, less_than: 90}
    validates :sex, :presence => true
    

end
