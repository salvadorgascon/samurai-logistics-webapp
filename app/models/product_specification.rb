# == Schema Information
#
# Table name: product_specifications
#
#  id                 :bigint           not null, primary key
#  cubic              :decimal(10, 2)
#  depth              :decimal(10, 2)
#  height             :decimal(10, 2)
#  is_batch_tracking  :boolean          default(FALSE)
#  is_serial_tracking :boolean          default(FALSE)
#  lock_version       :integer          default(0)
#  pack_size          :decimal(10, 2)
#  uid                :uuid             not null
#  weight             :decimal(10, 2)
#  width              :decimal(10, 2)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  product_id         :bigint           not null
#
# Indexes
#
#  index_product_specifications_on_product     (product_id) UNIQUE
#  index_product_specifications_on_product_id  (product_id)
#  index_product_specifications_on_uid         (uid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class ProductSpecification < ApplicationRecord
  belongs_to :product

  attribute :is_batch_tracking, :boolean, default: -> { false }
  attribute :is_serial_tracking, :boolean, default: -> { false }

  validates :uid, presence: true

  validates :width, numericality: { greater_than: 0 }, allow_nil: true
  validates :height, numericality: { greater_than: 0 }, allow_nil: true
  validates :depth, numericality: { greater_than: 0 }, allow_nil: true

  validates :weight, numericality: { greater_than: 0 }, allow_nil: true
  validates :cubic, numericality: { greater_than: 0 }, allow_nil: true

  validates :pack_size, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  validates :is_batch_tracking, inclusion: [true, false]
  validates :is_serial_tracking, inclusion: [true, false]
end
