class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.boolean :active, default:true

      t.timestamps null: false
    end
  end
end
