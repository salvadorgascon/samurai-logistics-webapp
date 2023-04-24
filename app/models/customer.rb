# == Schema Information
#
# Table name: customers
#
#  id            :bigint           not null, primary key
#  code          :string(50)       not null
#  ein_number    :string
#  lock_version  :integer          default(0)
#  name          :string           not null
#  notes         :text
#  search_text   :tsvector
#  state         :string           not null
#  state_at      :datetime         not null
#  state_notes   :text
#  states        :jsonb            is an Array
#  tags          :string           is an Array
#  tin_number    :string
#  uid           :uuid             not null
#  vat_number    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :integer          not null
#  updated_by_id :integer          not null
#
# Indexes
#
#  index_customers_on_code         (code) UNIQUE
#  index_customers_on_ein_number   (ein_number) UNIQUE
#  index_customers_on_name         (name) UNIQUE
#  index_customers_on_search_text  (search_text) USING gin
#  index_customers_on_state        (state)
#  index_customers_on_tags         (tags) USING gin
#  index_customers_on_tin_number   (tin_number) UNIQUE
#  index_customers_on_uid          (uid) UNIQUE
#  index_customers_on_vat_number   (vat_number) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id)
#  fk_rails_...  (updated_by_id => users.id)
#
class Customer < ApplicationRecord
  attr_readonly :search_text

  enum :state, %i[active archived], default: :active
  attribute :state_at, :datetime, default: -> { Time.zone.now }

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  include WithUid
  include WithState
  include ContainsCode
  include ContainsName

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
