class Address < ApplicationRecord
  validates :address_type, presence: true
  validates :street_address, presence: true

  belongs_to :user
  belongs_to :city
  belongs_to :state
  belongs_to :zipcode

  enum address_type: [:home, :billing]
  
  accepts_nested_attributes_for :city, :state, :zipcode

  def city_attributes=(city_attributes)
    city_attributes.values.each do |city_attribute|
      city = City.find_or_create_by(name: city_attribute)
      self.city = city
    end
  end

  def state_attributes=(state_attributes)
    state_attributes.values.each do |state_attribute|
      state = State.find_or_create_by(name: state_attribute)
      self.state = state
    end
  end

  def zipcode_attributes=(zipcode_attributes)
    zipcode_attributes.values.each do |zipcode_attribute|
      if zipcode_attribute.empty?
        return
      else
        zipcode = Zipcode.find_or_create_by(number: zipcode_attribute.to_i)
        self.zipcode = zipcode
      end
    end
  end
end
