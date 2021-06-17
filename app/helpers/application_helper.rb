module ApplicationHelper
  def user_avatar(user, options = { height: 40, width: 40 })
    if user.avatar.attached?
      cl_image_tag user.avatar.key, options
    else
      image_tag "useravatar.png", options
    end
  end
end
