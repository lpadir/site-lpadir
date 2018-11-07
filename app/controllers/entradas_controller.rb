class EntradasController < ApplicationController

    before_action :require_acesso
    
    def index
        @entrada = Entrada.paginate(page: params[:page], per_page: 10)
    end
    
    def new
        @entrada = Entrada.new
    end
    
    def create
        @entrada = Entrada.new(entrada_params)
        @entrada.usuario = current_user
        @entrada.porta = Porta.find(6)
        
        if @entrada.save
            flash[:success] = "Porta de #{@entrada.porta.comodo} do #{@entrada.porta.local} aberta com sucesso!"
            redirect_to root_path
            
        else
            render 'new'
        end
    end
    
    def show
        
    end
    
    private
    def set_entrada
        @entrada = Porta.find(params[:id])
    end
    
    def entrada_params
        params.require(:entrada).permit(:usuario_id, :porta_id)
    end
    
    def require_acesso
        
        if logged_in? and !current_user.acesso_lab?

            flash[:danger] = "Você não possui acesso a essa porta!"
            redirect_to root_path

        end
    end

end