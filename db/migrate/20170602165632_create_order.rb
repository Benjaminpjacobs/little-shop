class CreateOrder < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :status
      t.datetime :paid_date
      t.datetime :cancelled_date
      t.datetime :completed_date

      t.timestamps
    end
  end
end
