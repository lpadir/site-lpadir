class UsuariosController < ApplicationController
    
    def index
        @usuarios = Usuario.paginate(page:params[:page], per_page: 5)
    end
    
    def new
        @usuario = Usuario.new
    end
    
    def create
        @usuario = Usuario.new(usuario_params)
        if @usuario.save
           flash[:success] = "Usuário #{@usuario.username} cadastrado com sucesso!"
           redirect_to articles_path
        else
            render 'new'
        end
    end
    
    def edit
        @usuario = Usuario.find(params[:id])
    end
    
    def update
        @usuario = Usuario.find(params[:id])
        if @usuario.update(usuario_params)
            flash[:success] = "Usuário editado com sucesso!"
            redirect_to articles_path
        else
            render 'edit'
        end
    end
    
    def show
        @usuario = Usuario.find(params[:id])
        @usuario_articles = @usuario.articles.paginate(page: params[:page], per_page: 5)
    end
    
    private
    def usuario_params
        params.require(:usuario).permit(:username, :email, :password)
    end
    
end