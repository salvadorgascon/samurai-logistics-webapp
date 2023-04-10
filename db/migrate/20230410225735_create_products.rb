class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.string :code, limit: 50, null: false

      t.string :barcode_type
      t.string :barcode, limit: 50

      t.string :name, null: false
      t.text :short_description
      t.text :long_description

      t.references :brand

      t.string :unit_measure, null: false

      t.boolean :is_assembled, default: false
      t.boolean :is_component, default: false

      t.string :state, null: false
      t.datetime :state_at, null: false
      t.text :state_notes
      t.jsonb 'states', array: true

      t.string :tags, array: true

      t.text :notes

      t.column "search_text", :tsvector

      t.integer :created_by_id, null: false
      t.integer :updated_by_id, null: false

      t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_foreign_key :products, :brands

    add_foreign_key :products, :users, column: :created_by_id
    add_foreign_key :products, :users, column: :updated_by_id

    add_index :products, :uid, unique: true

    add_index :products, :code, unique: true
    add_index :products, :name, unique: true
    add_index :products, :barcode, unique: true

    add_index :products, :state
    add_index :products, :barcode_type
    add_index :products, :unit_measure

    add_index :products, :tags, using: "GIN"
    add_index :products, :search_text, using: "GIN"
  end
end
