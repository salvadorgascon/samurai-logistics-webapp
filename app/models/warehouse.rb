# == Schema Information
#
# Table name: warehouses
#
#  id            :bigint           not null, primary key
#  barcode       :string(50)
#  barcode_type  :string
#  code          :string(50)       not null
#  is_default    :boolean          default(FALSE)
#  lock_version  :integer          default(0)
#  name          :string           not null
#  notes         :text
#  search_text   :tsvector
#  state         :string           not null
#  state_at      :datetime         not null
#  state_notes   :text
#  states        :jsonb            is an Array
#  tags          :string           is an Array
#  uid           :uuid             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :integer          not null
#  customer_id   :bigint
#  supplier_id   :bigint
#  updated_by_id :integer          not null
#
# Indexes
#
#  index_warehouses_on_barcode       (barcode) UNIQUE
#  index_warehouses_on_barcode_type  (barcode_type)
#  index_warehouses_on_code          (code) UNIQUE
#  index_warehouses_on_customer_id   (customer_id)
#  index_warehouses_on_name          (name) UNIQUE
#  index_warehouses_on_search_text   (search_text) USING gin
#  index_warehouses_on_state         (state)
#  index_warehouses_on_supplier_id   (supplier_id)
#  index_warehouses_on_tags          (tags) USING gin
#  index_warehouses_on_uid           (uid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id)
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (supplier_id => suppliers.id)
#  fk_rails_...  (updated_by_id => users.id)
#
class Warehouse < ApplicationRecord
  attr_readonly :search_text

  enum :state, %i[active archived], default: :active
  enum :barcode_type, %i[upc ean _39 _128 itf _93 codabar gs1databar msiplessey qr datamatrix pdf417 aztec], default: :active
  attribute :state_at, :datetime, default: -> { Time.zone.now }

  belongs_to :customer, optional: true
  belongs_to :supplier, optional: true

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  validates :uid, presence: true

  validates :code, presence: true
  validates :code, length: { maximum: 50 }
  validates :code, uniqueness: true

  validates :name, presence: true
  validates :name, length: { maximum: 120 }
  validates :name, uniqueness: true

  validates :state, presence: true
  validates :state_at, presence: true
end
