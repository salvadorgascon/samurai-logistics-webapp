class CreateCostCenters < ActiveRecord::Migration[7.0]
  def change
    create_table :cost_centers do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()' 

    	t.string :code, limit: 50, null: false
      t.string :name, null: false

      t.string :tags, array: true

      t.column "search_text", :tsvector

      t.integer :created_by_id, null: false
      t.integer :updated_by_id, null: false

      t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_foreign_key :cost_centers, :users, column: :created_by_id
    add_foreign_key :cost_centers, :users, column: :updated_by_id

    add_index :cost_centers, :uid, unique: true

    add_index :cost_centers, :code, unique: true
    add_index :cost_centers, :name, unique: true
    
    add_index :cost_centers, :tags, using: "GIN"
    add_index :cost_centers, :search_text, using: "GIN"
  end
end
