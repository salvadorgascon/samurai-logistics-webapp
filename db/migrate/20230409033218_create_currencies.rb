class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.uuid :uid, null: false, default: 'uuid_generate_v4()'
      
      t.string :name_en, null: false
      t.string :name_es, null: false 
      t.string :iso_code_4217, limit: 3, null: false
      t.string :symbol, limit: 3      
      t.integer :num_decimals, default: 2

      t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_index :currencies, :uid, unique: true
    
    add_index :currencies, :name_en, unique: true
    add_index :currencies, :name_es, unique: true
    add_index :currencies, :iso_code_4217, unique: true
  end
end
