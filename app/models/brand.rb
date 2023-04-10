# == Schema Information
#
# Table name: brands
#
#  id            :bigint           not null, primary key
#  code          :string(50)       not null
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
#  updated_by_id :integer          not null
#
# Indexes
#
#  index_brands_on_code         (code) UNIQUE
#  index_brands_on_name         (name) UNIQUE
#  index_brands_on_search_text  (search_text) USING gin
#  index_brands_on_state        (state)
#  index_brands_on_tags         (tags) USING gin
#  index_brands_on_uid          (uid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id)
#  fk_rails_...  (updated_by_id => users.id)
#
class Brand < ApplicationRecord
  attr_readonly :search_text
  enum :state, %i[active archived], default: :active
  attribute :state_at, :datetime, default: -> { Time.zone.now }

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
