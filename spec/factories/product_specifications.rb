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
FactoryBot.define do
  factory :product_specification do
    
  end
end
