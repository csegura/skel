class UsersController < ApplicationController
  before_filter :authenticate_user!

  #respond_to :html, :xml, :js

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Usuario creado #{user.name}"
      redirect_to users_path
    else
       render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Usuario actualizado #{user.name}"
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Usuario eliminado #{user.name}"
    redirect_to users_path
  end

end

