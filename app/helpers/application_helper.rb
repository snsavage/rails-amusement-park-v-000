module ApplicationHelper
  def logged_in?
    !!@current_user
  end

  def current_user
    @current_user
  end

  def admin?
    !!current_user.admin? if current_user
  end
end
