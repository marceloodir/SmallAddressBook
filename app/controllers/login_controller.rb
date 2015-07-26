class LoginController < ApplicationController
  def index
    redirect_to contacts_path if authenticate?
  end

  def auth
    user = User.new(user_params)
  	
    @user = User.find_by email: user.email, senha: user.senha
  	if @user
      session[:userid] = @user.id
      redirect_to contacts_path
  	else
  		redirect_to index_path, notice: 'Você não possui cadastro!'
    end

  end

  def logout
    session[:userid] = nil
    redirect_to index_path
  end

    def user_params
      params.permit(:email, :senha)
    end
end
