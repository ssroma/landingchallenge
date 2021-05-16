class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.string :node_id
      t.string :login
      t.string :name
      t.string :url
      t.string :avatar_url
      t.string :bio
      t.integer :public_repos
      t.integer :followers
      t.integer :following

      t.timestamps
    end
  end
end
