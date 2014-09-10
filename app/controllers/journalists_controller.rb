class JournalistsController < ApplicationController
  before_action :set_journalist, only: [:show, :edit, :update, :destroy]

  def index
    @journalists = Journalist.all
  end

  def show
  end

  def new
    @journalist = Journalist.new
  end

  def edit
  end

  def create
    @journalist = Journalist.new(journalist_params)
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

    def journalist_params
      params.require(:journalist).permit(:name)
    end
end
