module WorksHelper
  def timeline_works
    works ||= Work.all.sorted_by_most_recent.where("author_id IN (#{current_user.id},?)", following)

    render partial: 'shared/timeline', locals: { works: works }
  end

  def timeline_follows
    @timeline_follows ||= User.all.ordered_by_most_recent.where("id NOT IN (#{current_user.id},?)", following)
    render @timeline_follows
  end
end
