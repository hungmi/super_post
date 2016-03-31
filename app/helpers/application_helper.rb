module ApplicationHelper
  def time_since(moment)
    difference = Time.now - moment
    if difference/60/60/24/7 >= 1
      return "#{(difference/60/60/24/7).round} weeks"
    elsif difference/60/60/24 >= 1
      return "#{(difference/60/60/24).round} days"
    elsif difference/60/60 >= 1
      return "#{(difference/60/60).round} hours"
    elsif difference/60 >= 1
      return "#{(difference/60).round} mins"
    else
      return "#{(difference).round} secs"
    end
  end

  def render_active(condition)
    "active" if condition
  end
end
