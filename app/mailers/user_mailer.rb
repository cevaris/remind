def welcome (current_user)
  mail(
    :from => "remind.me.dev@gmail.com",
    :to => current_user.email,
    :subject => "Thank you for signing"
  )
end

def confirm (current_user)
  mail(
    :from => "remind.me.dev@gmail.com",
    :to => current_user.email,
    :subject => "Please approve email"
  )
end