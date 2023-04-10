# == Schema Information
#
# Table name: companies
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
#  index_companies_on_code         (code) UNIQUE
#  index_companies_on_ein_number   (ein_number) UNIQUE
#  index_companies_on_name         (name) UNIQUE
#  index_companies_on_search_text  (search_text) USING gin
#  index_companies_on_state        (state)
#  index_companies_on_tags         (tags) USING gin
#  index_companies_on_tin_number   (tin_number) UNIQUE
#  index_companies_on_uid          (uid) UNIQUE
#  index_companies_on_vat_number   (vat_number) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id)
#  fk_rails_...  (updated_by_id => users.id)
#
require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
