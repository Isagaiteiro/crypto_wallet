# config/initializers/locale.rb

# Where the I18n library should search for translation files
#I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')] #Essa linha só é usada quando o desenvolvedor deseja guardar o arquivo em um repositório diferente.

# Permitted locales available for the application
I18n.available_locales = [:en, "pt-BR"] #Indica quais são os idiomas disponíveis na aplicação.

# Set default locale to something other than :en
I18n.default_locale = "pt-BR"  #Qual é o idioma padrão que já vem configurado assim que inicia a aplicação.
