class UsuariosController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update, :show]
    before_action :require_admin, only: [:destroy, :index]
    
    def index
        @usuarios = Usuario.paginate(page:params[:page], per_page: 5)
    end
    
    def new
        @usuario = Usuario.new
    end
    
    def create
        @usuario = Usuario.new(usuario_params)
        if @usuario.save
            session[:usuario_id] = @usuario.id
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
    
    def destroy
        @usuario = Usuario.find(params[:id])
        @usuario.destroy
        flash[:danger] = "O usuário e seus artigos foram apagados."
        redirect_to usuarios_path
    end
    
    private
    def usuario_params
        params.require(:usuario).permit(:username, :email, :password)
    end
    
    def set_user
        @usuario = Usuario.find(params[:id])
    end
    
    def require_same_user
        if current_user != @usuario and !current_user.admin?
            
            flash[:danger] = "Ação não permitida! Esse incidente será reportado!"
            redirect_to root_path
        
        end
    end
    
    def require_admin
        
        if logged_in? and !current_user.admin?

            flash[:danger] = "Somente administradores podem realizar essa ação! 
            Esse evento sera reportado!"
            redirect_to root_path

        end
    end
    
end