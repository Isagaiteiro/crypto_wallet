module ApplicationHelper
    def locale(locale)
        I18n.locale == :en ? "Estados Unidos" : "Português do Brasil" #IF utilizando ternário, é muito comum usar ternário quando o só tem duas respostas.
    end

    def data_br(data_us)
        data_us.strftime("%d/%m/%y")
    end

    def nome_aplicacao
        "CRYPTO WALLET APP"
    end

    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Produção"
        else 
            "Teste"
       end
    end
end
