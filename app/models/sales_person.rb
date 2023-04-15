# == Schema Information
#
# Table name: sales_people
#
#  id            :bigint           not null, primary key
#  direct_phone  :string
#  email         :string
#  fax           :string
#  first_name    :string
#  full_name     :string
#  id_number     :string
#  last_name     :string
#  lock_version  :integer          default(0)
#  mobile        :string
#  notes         :text
#  phone         :string
#  search_text   :tsvector
#  ssn_number    :string
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
#  index_sales_people_on_email        (email) UNIQUE
#  index_sales_people_on_fax          (fax)
#  index_sales_people_on_first_name   (first_name)
#  index_sales_people_on_id_number    (id_number) UNIQUE
#  index_sales_people_on_last_name    (last_name)
#  index_sales_people_on_mobile       (mobile)
#  index_sales_people_on_phone        (phone)
#  index_sales_people_on_search_text  (search_text) USING gin
#  index_sales_people_on_ssn_number   (ssn_number) UNIQUE
#  index_sales_people_on_state        (state)
#  index_sales_people_on_tags         (tags) USING gin
#  index_sales_people_on_uid          (uid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id)
#  fk_rails_...  (updated_by_id => users.id)
#
class SalesPerson < ApplicationRecord
  enum :state, %i[active archived], default: :active
  attribute :state_at, :datetime, default: -> { Time.zone.now }

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  validates :uid, presence: true
  validates :state, presence: true
  validates :state_at, presence: true
end
