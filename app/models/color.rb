# == Schema Information
#
# Table name: colors
#
#  id            :bigint           not null, primary key
#  lock_version  :integer          default(0)
#  name          :string           not null
#  uid           :uuid             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :integer          not null
#  updated_by_id :integer          not null
#
# Indexes
#
#  index_colors_on_name  (name) UNIQUE
#  index_colors_on_uid   (uid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (created_by_id => users.id)
#  fk_rails_...  (updated_by_id => users.id)
#
class Color < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  validates :uid, presence: true

  validates :name, presence: true
  validates :name, length: { maximum: 255 }
  validates :name, uniqueness: true
end
