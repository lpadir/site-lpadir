class UsuariosController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
     before_action :require_same_user, only: [:edit, :update]
    
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
           redirect_to root_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @usuario.update(usuario_params)
            flash[:success] = "Usuário editado com sucesso!"
            @usuario1 = @usuario.id
            redirect_to usuario_path(current_user)
        else
            render 'edit'
        end
    end
    
    def show
        @usuario_articles = @usuario.articles.paginate(page: params[:page], per_page: 5)
    end
    
    private
    def usuario_params
        params.require(:usuario).permit(:username, :email, :password)
    end
    
    def set_user
        @usuario = Usuario.find(params[:id])
    end
    
end