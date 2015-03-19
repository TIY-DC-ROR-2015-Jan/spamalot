class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.belongs_to :user, index: true
      t.belongs_to :spam, index: true

      t.timestamps null: false
    end
    add_foreign_key :deliveries, :users
    add_foreign_key :deliveries, :spams
  end
end
