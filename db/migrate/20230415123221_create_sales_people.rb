class CreateSalesPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_people do |t|
    	t.uuid :uid, null: false, default: 'uuid_generate_v4()'

    	t.string :first_name
      t.string :last_name
      t.string :full_name

      t.string :id_number
      t.string :ssn_number

      t.string :email
      t.string :phone
      t.string :fax
      t.string :mobile
      t.string :direct_phone

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

    add_foreign_key :sales_people, :users, column: :created_by_id
    add_foreign_key :sales_people, :users, column: :updated_by_id

    add_index :sales_people, :uid, unique: true

    add_index :sales_people, :first_name
    add_index :sales_people, :last_name
    add_index :sales_people, :email, unique: true
    add_index :sales_people, :phone
    add_index :sales_people, :fax
    add_index :sales_people, :mobile

    add_index :sales_people, :id_number, unique: true
    add_index :sales_people, :ssn_number, unique: true

    add_index :sales_people, :state

    add_index :sales_people, :tags, using: "GIN"
    add_index :sales_people, :search_text, using: "GIN"
  end
end
