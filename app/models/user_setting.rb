# == Schema Information
#
# Table name: user_settings
#
#  id           :bigint           not null, primary key
#  lock_version :integer          default(0)
#  uid          :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_user_settings_on_uid      (uid) UNIQUE
#  index_user_settings_on_user     (user_id) UNIQUE
#  index_user_settings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserSetting < ApplicationRecord
  belongs_to :user

  include WithUser

  validates :uid, presence: true
end
