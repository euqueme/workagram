class WorksController < ApplicationController
  before_action :logged_in_user, only: %i[create index]

  def index
    @work = Work.new
  end

  def create
    @work = current_user.works.build(work_params)
    if @work.save
      flash[:success] = 'Work created!'
      redirect_to root_path
    else
      flash.now[:danger] = "Couldn\'nt create work"
      render 'index'
    end
  end

  private

  def work_params
    params.require(:work).permit(:text, :picture)
  end
end
