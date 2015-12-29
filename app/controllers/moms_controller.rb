class MomsController < ApplicationController
  layout "check"

  before_action :find_mom, only: [:edit, :update]

  def find_mom
    @mom = Mom.find(params[:id])
  end

  def index
    @moms = Mom.all.sort_by{|e| e[:name]}
  end

  def show
    find_mom
  end

  def show_children
    @mom = Mom.find(params[:mom_id])
    @kids = @mom.children.sort_by{|e| e[:name]}
  end

  def new
    @mom = Mom.new
  end

  def edit
  end

  def create
    Mom.create(mom_params[:mom])
    redirect_to moms_path
  end

  def update
    @mom.update(mom_params[:mom])
    redirect_to show
  end


  private

  def mom_params
    params.permit(mom: [:name, :job, :age])
  end

end
