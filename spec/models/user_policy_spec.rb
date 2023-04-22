# == Schema Information
#
# Table name: user_policies
#
#  id           :bigint           not null, primary key
#  lock_version :integer          default(0)
#  policy       :string           not null
#  uid          :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_user_policies_on_policy    (policy)
#  index_user_policies_on_uid       (uid) UNIQUE
#  index_user_policies_on_user_id   (user_id)
#  index_user_policies_user_policy  (user_id,policy) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserPolicy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
