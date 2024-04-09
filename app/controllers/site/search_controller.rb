class Site::SearchController < SiteController
    # Esta classe de controlador lida com pesquisas no site
  
    # Método para buscar perguntas
             
    def questions
      # Carrega as perguntas com suas respostas associadas
      @questions = Question. _search_(params[:page], params[:term])
      end

      def subject
        @questions = Question._search_subject_(params[:page],
       params[:subject_id])
        end


  end
  
  #eu poderia usar a biblioteca "Full Text Search" em vez de usar o operador LIKE