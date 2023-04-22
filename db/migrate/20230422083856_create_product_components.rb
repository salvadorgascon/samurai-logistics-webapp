class CreateProductComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :product_components do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()' 

      t.references :product, null: false
      t.references :component, null: false

      t.string :product_composition, null: false

      t.decimal :percentage, :precision => 10, :scale => 4
      t.decimal :units, :precision => 10, :scale => 2

      t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_foreign_key :product_components, :products
    add_foreign_key :product_components, :products, column: :component_id

    add_index :product_components, :uid, unique: true

    add_index :product_components, :product_composition

    add_index :product_components, [ :product_id, :component_id], unique: true, name: 'index_product_components_on_component'
  end
end
