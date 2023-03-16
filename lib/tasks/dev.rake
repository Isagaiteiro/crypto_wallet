namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o banco de dados...") { %x(rails db:drop) }

      show_spinner("Criando o banco de dados...") { %x(rails db:create)}

      show_spinner("Migrando as tabelas...") {%x(rails db:migrate)}

      show_spinner("Populando o banco de dados...") {%x(rails db:seed)}
      %x(rails dev:add_mining_types) # #invocando a task dev:add_mining_types para cadastrar os tipos de mineração
      %x(rails dev:add_coins) #invocando a task dev:add_coins para cadastrar as moedas

      
    else
      puts "Você não está no ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
   
      coins = [
          {
              description: "Bitcoin", 
              acronym: "BTC", 
              url_image: "https://cdn-icons-png.flaticon.com/512/991/991959.png",
              #mining_type: MiningType.where(acronym: 'PoW') #Dá erro pois quando usa where, o active record recebe um array de elementos que possuem a consição passada, sendo que ele precisa receber somente um elemento.
              #mining_type: MiningType.where(acronym: 'PoW').first #Para corrigir o erro do comando anterior, pode ser indicado para pegar somente o primeiro elemento do array que retornou na pesquisa.
              #mining_type: MiningType.find(acronym: 'PoW') #Dessa forma ele retorna somente um elemento, mais dessa forma tamber dá erro, pois o find exige que seja informado o ID e não a sigla
              mining_type: MiningType.find_by(acronym: 'PoW') #Dessa forma ele permite encontrar pela sigla
          }, 
          {
              description: "Ethereum", 
              acronym: "ETH", 
              url_image: "https://assets.stickpng.com/images/5a7593f664538c292dec1bbe.png",
              mining_type: MiningType.all.sample
          }, 
          {
              description: "Dash", 
              acronym: "DASH", 
              url_image: "https://icons-for-free.com/iconfiles/png/512/dash-1324440144814589350.png",
              mining_type: MiningType.all.sample
          },
          {
              description: "Iota", 
              acronym: "IOT", 
              url_image: "https://coins.com.br/img/criptos/IOTA.png",
              mining_type: MiningType.all.sample
          },
          {
              description: "ZCash", 
              acronym: "ZEC", 
              url_image: "https://cdn-icons-png.flaticon.com/512/1418/1418194.png",
              mining_type: MiningType.all.sample
          }
      ]

      coins.each do |coin|
          #Se já existir esse elemento no banco de dados, ele não irá criar um novo, só irá criar se n tiver cadastrado o banco de dados
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
    
      mining_types = [
        {
          description: "Proof of Work",
          acronym: "PoW"
        },
        {
          description: "Proof of Stake",
          acronym: "PoS"
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC"
        }
      ]
      mining_types.each do |mining_type|
        #Se já existir esse elemento no banco de dados, ele não irá criar um novo, só irá criar se n tiver cadastrado o banco de dados
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield #Executa um bloco de código entre do e end quando tem várias linhas, ou entre chaves quando tem só uma linha a ser executada
    spinner.success(msg_end)
  end
end
