class SessionsController < ApplicationController
  def new
  end

  def create
    cookies.encrypted.permanent[:authenticated] = true
    redirect_to protected_path
  end

  def destroy
    cookies.delete(:authenticated)
    redirect_to root_path
  end

  def protected
    unless cookies.encrypted[:authenticated]
      head :unauthorized
    end
  end
end
