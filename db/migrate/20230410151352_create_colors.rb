class CreateColors < ActiveRecord::Migration[7.0]
  def change
    create_table :colors do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.string :name, null: false

      t.integer :created_by_id, null: false
      t.integer :updated_by_id, null: false

    	t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_foreign_key :colors, :users, column: :created_by_id
    add_foreign_key :colors, :users, column: :updated_by_id

    add_index :colors, :uid, unique: true
    add_index :colors, :name, unique: true
  end
end
