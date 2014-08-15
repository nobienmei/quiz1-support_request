class SupportsController < ApplicationController
  before_action :set_support, only: [:show, :edit, :update, :destroy]

  def index
    @supports = Support.all

  end

  def show
  end

  def new
    @support = Support.new
  end

  def edit
  end


  def create

    @support = Support.new(support_params)


    respond_to do |format|
      if @support.save
        format.html { redirect_to @support, notice: 'Message was successfully created.' }

        format.json { render action: 'show', status: :created, location: @support }
      else
        format.html { render action: 'new' }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    # sleep 3
    respond_to do |format|
      if @support.update(support_params)
        format.html { redirect_to @support, notice: 'Message was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end




 def destroy
    @support.destroy
    respond_to do |format|
      format.html { redirect_to support_url }
      #format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support
      @support = Support.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_params
      params.require(:support).permit(:name, :email, :department, :message)
    end

end
