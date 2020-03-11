class WorksController < ApplicationController
  before_action :logged_in_user, only: [:create, :index]

  def index
    @work = Work.new
    timeline_follows
  end

  def create
    @work= current_user.works.build(work_params)
    if @work.save
      flash[:success] = "work created!"
      redirect_to root_path
    else
      flash[:error] = "couldn\'nt create work"
      redirect_to root_path
    end
  end

  private

    def work_params
      params.require(:work).permit(:text, :picture)
    end

    def timeline_follows
      @timeline_follows ||= User.all.ordered_by_most_recent.where("id NOT IN (#{current_user.id},?)",following)
    end

end