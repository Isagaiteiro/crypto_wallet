class Coin < ApplicationRecord
    #Usa o belong_to quando tem uma ID que se relaciona com outra tabela, dessa forma Coins pertence a mining_types
    #Quando coloca essa associação dentro do model, está dizendo ao ActiveRecord que o model Coin vai conversar com o model MiningType
    belongs_to :mining_type # optional: true   ##Determina que o campo é opcional, não precisa ser preenchido na hora que cadastra, dessa forma ele vai cadastrar a moeda e vai deixar vazio o campo mining_type.

end
