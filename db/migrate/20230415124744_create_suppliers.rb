class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change    
    create_table :suppliers do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

      t.string :code, limit: 50, null: false
      t.string :name, null: false

      t.string :vat_number
      t.string :ein_number
      t.string :tin_number

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

    add_foreign_key :suppliers, :users, column: :created_by_id
    add_foreign_key :suppliers, :users, column: :updated_by_id

    add_index :suppliers, :uid, unique: true

    add_index :suppliers, :code, unique: true
    add_index :suppliers, :name, unique: true

    add_index :suppliers, :vat_number, unique: true
    add_index :suppliers, :ein_number, unique: true
    add_index :suppliers, :tin_number, unique: true

    add_index :suppliers, :state

    add_index :suppliers, :tags, using: "GIN"
    add_index :suppliers, :search_text, using: "GIN"
  end
end
