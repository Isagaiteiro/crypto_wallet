class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - Jackson Pires [COOKIE]"
    session[:curso] = "Curso de Ruby on Rails - Jackson Pires [SESSION]"
    @nome = params[:nome] 
    #Através da variável global params, pegs o [:nome] que está vindo pela URL e armazena ele dentro da variável de sessão @nome
    @curso = params[:curso]
  end
end
