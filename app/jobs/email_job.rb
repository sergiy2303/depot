class EmailJob
  include SuckerPunch::Job

  def confirmation(user)
    user.send_instructions!
  end
end
