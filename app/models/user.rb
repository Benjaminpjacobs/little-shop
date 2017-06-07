class User < ApplicationRecord
  has_secure_password
  validates :email, :first_name, :last_name, :role, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  enum role: [:user, :admin]
  has_many :addresses
  has_many :orders

  def full_name
    "#{first_name}" + ' ' + "#{last_name}"
  end

  def full_address
    address = addresses.first
    "#{address.street_address} #{address.city.name}, #{address.state.name} #{address.zipcode.number}"
  end

  def address_status
    if addresses.empty?
      "user_without_address"
    else
      "user_with_address"
    end
  end
end
