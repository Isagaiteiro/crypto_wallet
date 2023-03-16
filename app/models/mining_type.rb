class MiningType < ApplicationRecord
    #Has_mani (tem muitas), realiza a associação inversa, dessa forma o ActiveRecord vai procurar na tabela coins todos os registros com o manyng_type e vai mostrar todos que estão em cada tipo de mineração
    has_many :coins
end
