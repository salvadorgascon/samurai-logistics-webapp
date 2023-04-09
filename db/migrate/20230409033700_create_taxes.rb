class CreateTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :taxes do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.string :code, limit: 50, null: false
      t.string :name_en, null: false, null: false
      t.string :name_es, null: false, null: false

      t.decimal :rate, :precision => 10, :scale => 4, null: false

      t.boolean :is_purchase_tax, default: false
      t.boolean :is_sales_tax, default: false

      t.string :tags, array: true

      t.column "search_text", :tsvector

      t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_index :taxes, :uid, unique: true

    add_index :taxes, :code, unique: true
    add_index :taxes, :name_en, unique: true
    add_index :taxes, :name_es, unique: true

    add_index :taxes, :tags, using: "GIN"
    add_index :taxes, :search_text, using: "GIN"
  end
end
