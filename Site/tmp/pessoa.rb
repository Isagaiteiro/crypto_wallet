class Pessoa
    @nome = ""
    
    def initialize(novo_nome)
        @nome = novo_nome
    end
    def meu_nome
        @nome
    end
end

p1 = Pessoa.new("Isabela")
p2 = Pessoa.new("Anna")

puts p1.meu_nome
puts p2.meu_nome