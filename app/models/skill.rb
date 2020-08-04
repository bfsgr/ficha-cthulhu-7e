class Skill < ApplicationRecord
    belongs_to :character

    def self.available
        [
            ['Antropologia', 1],
            ['Arqueologia', 1],
            ['Arremessar', 20],
            ['Arte/Ofício', 5],
            ['Astronomia', 1],
            ['Avaliação', 5],
            ['Biologia', 1],
            ['Botânica', 1],
            ['Cavalgar', 5],
            ['Charme', 15],
            ['Chaveiro', 1],
            ['Ciência Forense', 1],
            ['Conserto Elétrico', 10],
            ['Conserto Mecânico', 10],
            ['Contabilidade', 5],
            ['Criptografia', 1],
            ['Direito', 5],
            ['Dirigir', 20],
            ['Disfarce', 5],
            ['Eletrônica', 1],
            ['Encontrar', 25],
            ['Engenharia', 1],
            ['Escalar', 20],
            ['Escutar', 20],
            ['Esquivar', 'DES/2'],
            ['Farmácia', 1],
            ['Física', 1],
            ['Furtividade', 20],
            ['Geologia', 1],
            ['História', 5],
            ['Intimidação', 15],
            ['Lábia', 5],
            ['Língua (Nat)', "EDU"],
            ['Língua (Outra)', 1],
            ['Matemática', 1],
            ['Medicina', 1],
            ['Mergulho', 1],
            ['Meteorologia', 1],
            ['Mundo Natural', 10],
            ['Mythos', 0],
            ['Natação', 20],
            ['Navegação', 10],
            ['Nível de crédito', 0],
            ['Ocultismo', 5],
            ['Operar Maquinário Pesado', 1],
            ['Persuasão', 10],
            ['Pilotar (Aéreo)', 1],
            ['Pilotar (Naval)', 1],
            ['Prestidigitação', 10],
            ['Primeiros Socorros', 20],
            ['Psicanálise', 1],
            ['Psicologia', 10],
            ['Química', 1],
            ['Rastrear', 10],
            ['Saltar', 20],
            ['Usar Bibliotecas', 20],
            ['Usar Computadores', 5],
            ['Zoologia', 1],
            ['Arcos', 15],
            ['Armas Pesadas', 10],
            ['Lança-chamas', 10],
            ['Metralhadoras', 10],
            ['Pistolas', 20],
            ['Rifles/Espingardas', 25],
            ['Submetralhadoras', 15],
            ['Briga', 25],
            ['Chicotes', 5],
            ['Espadas', 20],
            ['Garrote', 15],
            ['Machados', 15],
            ['Manguais', 10],
            ['Motosserras', 10],
        ]
    end 

    def self.art 
        [
            "Atuação",
            "Barbeiro",
            "Caligrafia",
            "Carpintaria",
            "Cozinheiro",
            "Dança",
            "Belas Artes",
            "Falsificação",
            "Escritor",
            "Dançarino de Morris",
            "Cantor de Ópera",
            "Pintor e Decorador",
            "Fotografia",
            "Oleiro",
            "Escultor",
            "Soprador de Tubos de Vidro"
        ]
    end
end
