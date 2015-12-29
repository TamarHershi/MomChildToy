class ChildrenController < ApplicationController

  before_action :find_child, only: [:show]

  def find_child
    @child = Child.find(params[:id])
  end

  def index
    @children = Child.all
  end

  def show
  end

  def new
    @mom = Mom.find(params[:mom_id])
    @child = Child.new
  end

  def create
    Child.create(child_params[:child])
    redirect_to mom_show_children_path(params[:child][:mom_id])
  end


  def show_toys
    if !params[:child_id].nil?
      child = Child.find(params[:child_id])
      @toys = child.toys.sort_by{|e| e[:kind]}
    else
      find_child
      @toys = @child.toys.sort_by{|e| e[:kind]}
    end
  end

  private

  def child_params
    params.permit(child: [:name, :gender, :age, :mom_id])
  end



end
