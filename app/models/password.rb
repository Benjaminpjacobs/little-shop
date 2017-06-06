class Password

  def self.confirm_submission(password)
    confirm_old(password[:old], password[:id]) && confirm_new(password[:new], password[:confirm])
  end

  def self.confirm_old(password, id)
    user = User.find(id)
    user.authenticate(password)
  end

  def self.confirm_new(new_password, confirm)
    new_password == confirm
  end

end
