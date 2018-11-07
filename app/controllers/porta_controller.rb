class PortaController < ApplicationController
    
    before_action :set_porta, only: [:edit, :update, :show, :destroy]

    before_action :require_admin
    
    def index
        @portas = Porta.paginate(page:params[:page], per_page: 10)
    end
    
    def new
        @porta=Porta.new
    end
    
    def create
        @porta = Porta.new(porta_params)
        if @porta.save
            flash[:success] = "Porta cadastrada com sucesso!"
            redirect_to root_path
        else
            render 'new'
        end

    end
    
    def edit
        
    end
    
    def update
        if @porta.update(porta_params)
            flash[:success] = "Porta editada com sucesso!"
            redirect_to root_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @porta = Porta.find(params[:id])
        @porta.destroy
        flash[:danger] = "Porta removida com sucesso!"
        redirect_to root_path
    end
    
    private
    def porta_params
        params.require(:porta).permit(:local, :comodo)
    end
    
     def set_porta
        @porta = Porta.find(params[:id])
    end
    
    def require_admin
        
        if logged_in? and !current_user.admin?

            flash[:danger] = "Somente administradores podem realizar essa ação! 
            Esse evento sera reportado!"
            redirect_to root_path

        end
    end
    
end