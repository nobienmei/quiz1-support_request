class SupportsController < ApplicationController
  before_action :get_ticket, only: [:edit, :update, :destroy, :mark_resolved, :mark_unresolved]

  def index
    @supports = Support.paginate(:page => params[:page]).search(params[:search])
  end

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    if @support.save
      redirect_to supports_path, notice: "Ticket created! Thank you for contacting us."
    else
      flash.now[:alert] = "Something went wrong when creating your ticket!"
      render :new
    end
  end

  def edit
  end

  def update
    if @support.update_attributes(support_params)
      redirect_to supports_path, notice: "Ticket is updated."
    else
      flash.now[:alert] = "Something went wrong when updating your request!"
      render :edit
    end
  end

  def destroy
    @support.destroy
    redirect_to supports_path, notice: "Ticket successfully destroyed."
  end

  def mark_resolved
    @support.status = 1
    @support.save
    redirect_to supports_path
  end

  def mark_unresolved
    @support.status = 0
    @support.save
    redirect_to supports_path
  end

  private


  def get_ticket
    @support = Support.find(params[:id])
  end

  def support_params
    params.require(:support).permit(:name, :email, :department, :message)
  end

end
