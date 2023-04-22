class CreateProductSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :product_specifications do |t|
      t.uuid :uid, null: false, default: 'uuid_generate_v4()' 

    	t.references :product, null: false

      t.decimal :pack_size, :precision => 10, :scale => 2
      t.decimal :width, :precision => 10, :scale => 2
      t.decimal :height, :precision => 10, :scale => 2
      t.decimal :weight, :precision => 10, :scale => 2
      t.decimal :depth, :precision => 10, :scale => 2
      t.decimal :cubic, :precision => 10, :scale => 2

      t.boolean :is_batch_tracking, default: false
      t.boolean :is_serial_tracking, default: false

      t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_foreign_key :product_specifications, :products

    add_index :product_specifications, :uid, unique: true

    add_index :product_specifications, :product_id, unique: true, name: 'index_product_specifications_on_product' 
  end
end
