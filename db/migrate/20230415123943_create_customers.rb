class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
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

    add_foreign_key :customers, :users, column: :created_by_id
    add_foreign_key :customers, :users, column: :updated_by_id

    add_index :customers, :uid, unique: true

    add_index :customers, :code, unique: true
    add_index :customers, :name, unique: true

    add_index :customers, :vat_number, unique: true
    add_index :customers, :ein_number, unique: true
    add_index :customers, :tin_number, unique: true

    add_index :customers, :state

    add_index :customers, :tags, using: "GIN"
    add_index :customers, :search_text, using: "GIN"
  end
end
