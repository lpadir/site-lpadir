class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        
        if @article.save
            flash[:success] = "Artigo criado com sucesso!"
            redirect_to article_path(@article)
            
        else
            render 'new'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] = "Artigo atualizado com sucesso!"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def index
        @articles = Article.all
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        flash[:danger] = "Artigo deletado com sucesso!"
        
        redirect_to articles_path
    end
    
    private
    def article_params
        params.require(:article).permit(:titulo, :descricao)
    end
end