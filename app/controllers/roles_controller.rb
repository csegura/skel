class RolesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :xml, :js

  def index
    @roles = Role.all
  end

  def create
    @role = Role.create(params[:role])
    if @role.save
      flash[:notice] = "Successfully created."
    end
    respond_with @role
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:notice] = "Successfully destroyed"
    respond_with @role
  end
end

