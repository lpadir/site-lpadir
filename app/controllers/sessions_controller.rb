class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        
        usuario = Usuario.find_by(email:params[:session][:email].downcase)
        
        if usuario && usuario.authenticate(params[:session][:password])
            session[:usuario_id] = usuario.id
            flash[:success] = "Bem-vindo #{usuario.username}"
            redirect_to usuario_path(current_user)
        else
            flash[:danger] = "Dados incorretos. Tente novamente!"
            render 'new'
        end
    end
    
    def destroy
        session[:usuario_id] = nil
        flash[:success] = "Você foi deslogado."
        redirect_to root_path
    end
    
end