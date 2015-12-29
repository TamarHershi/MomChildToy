class ToysController < ApplicationController

  before_action :get_toy, only: [:index, :edit, :update]
  before_action :get_child, only: [:new]

  def get_child
    @child = Child.find(params[:child_id])
  end

  def get_toy
    @toy = Toy.find(params[:id])
  end


  def index
      child = Child.find(@toy.child_id)
      @toys = child.toys
  end

  def new
    @toy = Toy.new
  end

  def edit
  end

  def destroy
    Toy.destroy(params[:id])
    redirect_to show_toys_children_path(params[:child_id])
  end

  def update
    @child = Child.find(@toy.child_id)
    @toy.update(toy_params[:toy])
    redirect_to show_toys_children_path(@child.id)
  end

  def create
    Toy.create(toy_params[:toy])
    redirect_to show_toys_children_path(params[:toy][:child_id])
  end

  private

  def toy_params
    params.permit(toy: [:kind, :color, :child_id])
  end
end
