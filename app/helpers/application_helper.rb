module ApplicationHelper
  def time_since(moment)
    difference = Time.now - moment
    if difference/60/60/24/7 >= 1
      return "#{(difference/60/60/24/7).round} weeks ago"
    elsif difference/60/60/24 >= 1
      return "#{(difference/60/60/24).round} days ago"
    elsif difference/60/60 >= 1
      return "#{(difference/60/60).round} hours ago"
    elsif difference/60 >= 1
      return "#{(difference/60).round} mins ago"
    else
      return "#{(difference).round} secs ago"
    end
  end
end
