class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.string :name_en, null: false
      t.string :name_es, null: false
    	t.string :iso_code_3166_1, null: false

    	t.integer :lock_version, :default => 0
      t.timestamps
    end

    add_index :countries, :uid, unique: true

    add_index :countries, :name_en, unique: true
    add_index :countries, :name_es, unique: true
    add_index :countries, :iso_code_3166_1, unique: true
  end
end
