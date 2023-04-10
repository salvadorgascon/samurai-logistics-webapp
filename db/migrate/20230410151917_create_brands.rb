class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.string :code, limit: 50, null: false
      t.string :name, null: false

      t.string :state, null: false
      t.datetime :state_at, null: false
      t.text :state_notes
      t.jsonb 'states', array: true

      t.text :notes

      t.string :tags, array: true

      t.column "search_text", :tsvector

      t.integer :created_by_id, null: false
      t.integer :updated_by_id, null: false

      t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_foreign_key :brands, :users, column: :created_by_id
    add_foreign_key :brands, :users, column: :updated_by_id

    add_index :brands, :uid, unique: true

    add_index :brands, :code, unique: true
    add_index :brands, :name, unique: true

    add_index :brands, :state

    add_index :brands, :tags, using: "GIN"
    add_index :brands, :search_text, using: "GIN"
  end
end
