class WorksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :index]

  def index
    @work = Work.new
    timeline_works
  end

  def create
    @work= current_user.works.build(work_params)
    if @work.save
      flash[:success] = "work created!"
      redirect_to root_url
    else
      @feed_items = []
      redirect_to root_url
    end
  end

  private

    def work_params
      params.require(:work).permit(:text)
    end

    def timeline_works
      @timeline_works ||= Work.all.sorted_by_most_recent#.where('author_id IN (?)', users)
    end

end
