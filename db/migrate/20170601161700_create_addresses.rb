class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :name
    end

    create_table :cities do |t|
      t.string :name
    end

    create_table :zipcodes do |t|
      t.integer :number
    end

    create_table :addresses do |t|
      t.integer :address_type, default: 0
      t.string :street_address
      t.references :zipcode, foreign_key: true
      t.references :city, foreign_key: true
      t.references :state, foreign_key: true
      t.references :user, foreign_key: true
    end
    
  end
end
