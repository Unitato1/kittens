class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :edit, :destroy, :update]
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def destroy
    if @kitten.destroy
      flash[:notice] = "Deleted Cat! :O"
      redirect_to kittens_path
    else
      flash[:erros] = @kitten.errors.full_messages
      render @kitten
    end
  end

  def create
    @kitten = Kitten.new(kittens_params)
    if @kitten.save
      flash[:notice] = "New kitten added! YEY!"
      redirect_to @kitten
    else
      flash[:erros] = @kitten.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @kitten.update(kittens_params)
      flash[:notice] = "Updated"
      redirect_to @kitten
    else
      flash[:errors] = @kitten.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end
  private
  def find_kitten
    @kitten = Kitten.find(params[:id])
  end
  def kittens_params
    params.required(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
