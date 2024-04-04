class Site::SearchController < SiteController
    # Esta classe de controlador lida com pesquisas no site
  
    # Método para buscar perguntas
    def questions
      # Carrega as perguntas com suas respostas associadas
      @questions = Question.includes(:answers)  # Carrega as perguntas pré-carregando suas respostas para evitar consultas adicionais
                           .where("lower(description) LIKE ?", "%#{params[:term].downcase}%")  # Filtra perguntas cuja descrição contenha o termo de pesquisa, ignorando maiúsculas e minúsculas
                           .page(params[:page])  # Pagina os resultados para exibição em páginas
    end
  end
  
  #eu poderia usar a biblioteca "Full Text Search" em vez de usar o operador LIKE