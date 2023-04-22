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
class ProductComponent < ApplicationRecord
  enum :product_composition, %i[percent units]

  belongs_to :product
  belongs_to :component, class_name: 'Product'  

  validates :uid, presence: true

  validates :product_composition, presence: true

  validates :units, presence: true, if: proc { |a| a.product_composition == :units }
  validates :units, numericality: { greater_than: 0 }, if: proc { |a| a.product_composition == :units }

  validates :percentage, presence: true, if: proc { |a| a.product_composition == :percent }
  validates :percentage, numericality: { greater_than: 0 }, if: proc { |a| a.product_composition == :percent }
end
