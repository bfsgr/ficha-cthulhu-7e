class SkillController < ApplicationController
    before_action :authenticate_user, :validate_char
    def entrypoint
        
    end

    @@profs = [
        Profession.new("Advogado", [:op0 => [:stats => [:edu], :mult => 4]], [14, 16, 51, 55], [9, 30, 31, 45], 2, 30..80),
        Profession.new("Andarilho", ),
        Profession.new("Antiquário"),
        Profession.new("Artista"),
        Profession.new("Atleta"),
        Profession.new("Autor"),
        Profession.new("Bibliotecário"),
        Profession.new("Membro do clero"),
        Profession.new("Criminoso", [:op0 => [:stats => [:edu, :dex], :multi => 2], :op1 => [:stats => [:edu, :str], :multi => 2]],
            [] ),
        Profession.new("Detetive particular"),
        Profession.new("Diletante"),
        Profession.new("Engenheiro"),
        Profession.new("Fanático"),
        Profession.new("Fazendeiro"),
        Profession.new("Hacker"),
        Profession.new("Investigador de polícia"),
        Profession.new("Jornalista"),
        Profession.new("Médico"),
        Profession.new("Membro de tribo"),
        Profession.new("Missionário"),
        Profession.new("Músico"),
        Profession.new("Oficial de polícia"),
        Profession.new("Oficial militar"),
        Profession.new("Parapsicólogo"),
        Profession.new("Piloto"),
        Profession.new("Professor"),
        Profession.new("Profissional do entretenimento"),
        Profession.new("Soldado")
    ]
end

class Profession 
    #
    #   @name 
    #   @calc = [], describe the calculation methods
    #       ex: [:op0 => [:stats => [symbols], :mult => int ]]
    #
    #
    #   @default = [int], list of default skills
    #   @choose = [:skills => [...], :n => int ]..
    #   @free = int, number of free skills to choose
    #   @credit = x..y (range)
    #
    attr_reader :name, :calc, :default, :choose, :free, :credit
    def initialize(name, calc, default, choose, free, credit)
        @name = name
        @calc = calc
        @default = default
        @choose = choose
        @free = free
        @credit = credit
    end
end