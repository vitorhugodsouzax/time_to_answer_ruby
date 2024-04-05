class Site::SearchController < SiteController
    # Esta classe de controlador lida com pesquisas no site
  
    # Método para buscar perguntas
    def questions
      # Carrega as perguntas com suas respostas associadas
      @questions = Question.search(params[:page], params[:term])
    end
  end
  
  #eu poderia usar a biblioteca "Full Text Search" em vez de usar o operador LIKE