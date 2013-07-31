class FruitsController < ApplicationController
    def index
      @fruits = Fruit.all.reverse
      respond_to do |format|
      format.html
      format.json {render json: @fruits}
      end
    end

    def create
      @fruit = Fruit.new(:name => params[:name])
      if @fruit.save
        redirect_to fruit_path(@fruit)
      else
        render :new
      end
    end

    def show
      @fruit = Fruit.all.show
      format.html
    end

    def new
      @fruit = Fruit.new
      post '/new' do
      render :show
    end
  end


end