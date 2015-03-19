class CreateSpams < ActiveRecord::Migration
  def change
    create_table :spams do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
