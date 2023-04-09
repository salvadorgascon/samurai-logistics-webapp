# == Schema Information
#
# Table name: taxes
#
#  id              :bigint           not null, primary key
#  code            :string(50)       not null
#  is_purchase_tax :boolean          default(FALSE)
#  is_sales_tax    :boolean          default(FALSE)
#  lock_version    :integer          default(0)
#  name_en         :string           not null
#  name_es         :string           not null
#  rate            :decimal(10, 4)   not null
#  search_text     :tsvector
#  tags            :string           is an Array
#  uid             :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_taxes_on_code         (code) UNIQUE
#  index_taxes_on_name_en      (name_en) UNIQUE
#  index_taxes_on_name_es      (name_es) UNIQUE
#  index_taxes_on_search_text  (search_text) USING gin
#  index_taxes_on_tags         (tags) USING gin
#  index_taxes_on_uid          (uid) UNIQUE
#
class Tax < ApplicationRecord
  attr_readonly :search_text

  validates :uid, presence: true

  validates :code, presence: true
  validates :code, length: { maximum: 50 }
  validates :code, uniqueness: true

  validates :name_en, presence: true
  validates :name_en, length: { maximum: 120 }
  validates :name_en, uniqueness: true

  validates :name_es, presence: true
  validates :name_es, length: { maximum: 120 }
  validates :name_es, uniqueness: true

  validates :rate, presence: true
  validates :rate, numericality: { greater_than: 0 }
end
