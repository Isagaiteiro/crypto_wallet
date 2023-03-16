class WelcomeController < ApplicationController
  def index
    @nome = params[:nome] 
    #Através da variável global params, pegs o [:nome] que está vindo pela URL e armazena ele dentro da variável de sessão @nome
    @curso = params[:curso]
  end
end
