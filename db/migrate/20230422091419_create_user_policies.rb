class CreateUserPolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_policies do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.references :user, null: false
    	t.string :policy, null: false

    	t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_foreign_key :user_policies, :users

    add_index :user_policies, :uid, unique: true
    add_index :user_policies, :policy
    add_index :user_policies, [:user_id, :policy], unique: true, name: 'index_user_policies_user_policy'
  end
end
