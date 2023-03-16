class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :edit, :update, :destroy ] #Essa linha indica que será feito um set da variável coin antes de iniciar o código, somente para as ações declaradas: show, edit, update e destroy. Dessa forma não é preciso declarar uma veriável para ser usada nessas ações. 

  before_action :set_mining_type_options, only: [:new, :create, :edit, :update]

  #No caso do index, como ele não está listado, foi preciso declara a variável dentro da ação.
  # GET /coins or /coins.json
  def index
    @coins = Coin.all
  end

  # GET /coins/1 or /coins/1.json
  def show
  end

  # GET /coins/new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins or /coins.json
  def create
    @coin = Coin.new(coin_params)

    respond_to do |format|
      if @coin.save
        format.html { redirect_to coin_url(@coin), notice: "A moeda foi criada com sucesso." }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1 or /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to coin_url(@coin), notice: "A moeda foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1 or /coins/1.json
  def destroy
    @coin.destroy

    respond_to do |format|
      format.html { redirect_to coins_url, notice: "A moeda foi apagada com sucesso." }
      format.json { head :no_content }
    end
  end

  private #Métodos privados só podem ser acessados pelo próprio controller, outros arquivos e outras classes não conseguem acessa eles mesmo que conversem com o controller.

    def set_mining_type_options
      #Variável de sessão
      @set_mining_type_options = MiningType.all.pluck(:description, :id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])#Find retorna um único elemento.
    end

    # Only allow a list of trusted parameters through.
    def coin_params
      params.require(:coin).permit(:description, :acronym, :url_image, :mining_type_id) #Pega os params passados nos campos de nova moeda, dá um require em coin e permite a descrição, o Acronym e a url_image. Essa estrutura evita que qualquer pessoa envie dados intrusos, que não devem ser tratados pelo controller.
    end
end
