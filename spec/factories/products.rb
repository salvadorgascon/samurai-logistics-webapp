# == Schema Information
#
# Table name: products
#
#  id                :bigint           not null, primary key
#  barcode           :string(50)
#  barcode_type      :string
#  code              :string(50)       not null
#  is_assembled      :boolean          default(FALSE)
#  is_component      :boolean          default(FALSE)
#  lock_version      :integer          default(0)
#  long_description  :text
#  name              :string           not null
#  notes             :text
#  search_text       :tsvector
#  short_description :text
#  state             :string           not null
#  state_at          :datetime         not null
#  state_notes       :text
#  states            :jsonb            is an Array
#  tags              :string           is an Array
#  uid               :uuid             not null
#  unit_measure      :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  brand_id          :bigint
#  created_by_id     :integer          not null
#  updated_by_id     :integer          not null
#
# Indexes
#
#  index_products_on_barcode       (barcode) UNIQUE
#  index_products_on_barcode_type  (barcode_type)
#  index_products_on_brand_id      (brand_id)
#  index_products_on_code          (code) UNIQUE
#  index_products_on_name          (name) UNIQUE
#  index_products_on_search_text   (search_text) USING gin
#  index_products_on_state         (state)
#  index_products_on_tags          (tags) USING gin
#  index_products_on_uid           (uid) UNIQUE
#  index_products_on_unit_measure  (unit_measure)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (created_by_id => users.id)
#  fk_rails_...  (updated_by_id => users.id)
#
FactoryBot.define do
  factory :product do
    
  end
end
