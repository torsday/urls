class CreateUsersAndEditUrl < ActiveRecord::Migration
  def change
    add_column :urls, :user_id, :integer

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
