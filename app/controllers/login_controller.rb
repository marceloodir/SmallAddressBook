class LoginController < ApplicationController
  def index
  end

  def auth
    @user = User.new(user_params)
  	
    @user = User.find_by email: @user.email, senha: @user.senha

  	if @user 
      redirect_to users_path
  	else
  		redirect_to index_path, notice: 'Você não possui cadastro!'
    end

  end

    def user_params
      params.permit(:email, :senha)
    end
end
