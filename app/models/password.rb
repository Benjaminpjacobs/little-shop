class Password

  def self.confirm_submission(password)
    old = confirm_old(password[:old], password[:id])
    new_password = confirm_new(password[:new], password[:confirm])
    if old && new_password
      true
    else
      error_messages(old, new_password)
    end
  end

  def self.confirm_old(password, id)
    user = User.find(id)
    user.authenticate(password)
  end

  def self.confirm_new(new_password, confirm)
    new_password == confirm
  end

  def self.error_messages(old, new_password)
    message = []
    message << "Invalid Password" unless old
    message << "Passwords Do Not Match" unless new_password
    message
  end
end