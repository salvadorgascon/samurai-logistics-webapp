class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.string :iso_code_639_1, null: false
      t.string :locale, null: false      

      t.string :name_en, null: false
      t.string :name_es, null: false            

    	t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_index :languages, :uid, unique: true
    add_index :languages, :iso_code_639_1, unique: true    
    add_index :languages, :locale, unique: true 
    add_index :languages, :name_en, unique: true
    add_index :languages, :name_es, unique: true    
  end
end
