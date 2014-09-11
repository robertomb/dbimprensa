class JournalistsController < ApplicationController
  before_action :set_journalist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @journalists = Journalist.all
  end

  def show
  end

  def new
    @journalist = current_user.journalists.build
  end

  def edit
  end

  def create
    @journalist = current_user.journalists.build(journalist_params)
      if @journalist.save
        redirect_to @journalist, notice: 'Journalist was successfully created.'
      else
        render :new
      end
  end

  def update
      if @journalist.update(journalist_params)
        redirect_to @journalist, notice: 'Journalist was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @journalist.destroy
    redirect_to journalists_url, notice: 'Journalist was successfully destroyed.'
  end

  private
    def set_journalist
      @journalist = Journalist.find(params[:id])
    end


    def correct_user
      @journalist = current_user.journalists.find_by(id: params[:id])
      redirect_to journalist_path, notice: "Not authorized to edit this journalist" if @journalist.nil?
    end

    def journalist_params
      params.require(:journalist).permit(:name)
    end
end
