# == Schema Information
#
# Table name: countries
#
#  id              :bigint           not null, primary key
#  iso_code_3166_1 :string           not null
#  lock_version    :integer          default(0)
#  name_en         :string           not null
#  name_es         :string           not null
#  uid             :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_countries_on_iso_code_3166_1  (iso_code_3166_1) UNIQUE
#  index_countries_on_name_en          (name_en) UNIQUE
#  index_countries_on_name_es          (name_es) UNIQUE
#  index_countries_on_uid              (uid) UNIQUE
#
require 'rails_helper'

RSpec.describe Country, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
