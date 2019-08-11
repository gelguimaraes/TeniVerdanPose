class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.nome
      redirect_to indications_url
    else
      flash.now[:alert] = "<i class='fa fa-times'></i>".html_safe + " E-mail ou senha inválido!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
