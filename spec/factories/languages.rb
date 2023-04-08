# == Schema Information
#
# Table name: languages
#
#  id             :bigint           not null, primary key
#  iso_code_639_1 :string           not null
#  locale         :string           not null
#  lock_version   :integer          default(0)
#  name_en        :string           not null
#  name_es        :string           not null
#  uid            :uuid             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_languages_on_iso_code_639_1  (iso_code_639_1) UNIQUE
#  index_languages_on_locale          (locale) UNIQUE
#  index_languages_on_name_en         (name_en) UNIQUE
#  index_languages_on_name_es         (name_es) UNIQUE
#  index_languages_on_uid             (uid) UNIQUE
#
FactoryBot.define do
  factory :language do
    
  end
end
