class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

      t.string :code, limit: 50, null: false

      t.string :barcode_type
      t.string :barcode, limit: 50

      t.string :name, null: false

      t.references :supplier
      t.references :customer

      t.boolean :is_default, default: false

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

    add_foreign_key :warehouses, :customers
    add_foreign_key :warehouses, :suppliers

    add_foreign_key :warehouses, :users, column: :created_by_id
    add_foreign_key :warehouses, :users, column: :updated_by_id

    add_index :warehouses, :uid, unique: true

    add_index :warehouses, :code, unique: true
    add_index :warehouses, :barcode, unique: true
    add_index :warehouses, :name, unique: true

    add_index :warehouses, :barcode_type

    add_index :warehouses, :state

    add_index :warehouses, :tags, using: "GIN"
    add_index :warehouses, :search_text, using: "GIN"
  end
end
