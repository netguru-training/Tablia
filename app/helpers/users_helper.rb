module UsersHelper
  def is_user_current_user?(user)
    current_user == user
  end
end
