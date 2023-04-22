class CreateUserSettings < ActiveRecord::Migration[7.0]
  def change    
    create_table :user_settings do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.references :user, null: false

      t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_foreign_key :user_settings, :users

    add_index :user_settings, :uid, unique: true

    add_index :user_settings, :user_id, unique: true, name: 'index_user_settings_on_user'
  end
end
