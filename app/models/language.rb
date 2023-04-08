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
class Language < ApplicationRecord
  validates :uid, presence: true

  validates :iso_code_639_1, presence: true
  validates :iso_code_639_1, length: { maximum: 255 }
  validates :iso_code_639_1, uniqueness: true

  validates :name_en, presence: true
  validates :name_en, length: { maximum: 255 }
  validates :name_en, uniqueness: true

  validates :name_es, presence: true
  validates :name_es, length: { maximum: 255 }
  validates :name_es, uniqueness: true

  validates :locale, presence: true
  validates :locale, length: { maximum: 5 }
  validates :locale, uniqueness: true
end
