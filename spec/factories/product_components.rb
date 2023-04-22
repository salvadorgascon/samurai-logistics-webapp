# == Schema Information
#
# Table name: product_components
#
#  id                  :bigint           not null, primary key
#  lock_version        :integer          default(0)
#  percentage          :decimal(10, 4)
#  product_composition :string           not null
#  uid                 :uuid             not null
#  units               :decimal(10, 2)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  component_id        :bigint           not null
#  product_id          :bigint           not null
#
# Indexes
#
#  index_product_components_on_component            (product_id,component_id) UNIQUE
#  index_product_components_on_component_id         (component_id)
#  index_product_components_on_product_composition  (product_composition)
#  index_product_components_on_product_id           (product_id)
#  index_product_components_on_uid                  (uid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (component_id => products.id)
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :product_component do
    
  end
end
