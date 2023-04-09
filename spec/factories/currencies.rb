# == Schema Information
#
# Table name: currencies
#
#  id            :bigint           not null, primary key
#  iso_code_4217 :string(3)        not null
#  lock_version  :integer          default(0)
#  name_en       :string           not null
#  name_es       :string           not null
#  num_decimals  :integer          default(2)
#  symbol        :string(3)
#  uid           :uuid             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_currencies_on_iso_code_4217  (iso_code_4217) UNIQUE
#  index_currencies_on_name_en        (name_en) UNIQUE
#  index_currencies_on_name_es        (name_es) UNIQUE
#  index_currencies_on_uid            (uid) UNIQUE
#
FactoryBot.define do
  factory :currency do
    
  end
end
