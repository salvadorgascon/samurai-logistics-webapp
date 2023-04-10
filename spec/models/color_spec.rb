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
require 'rails_helper'

RSpec.describe Color, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
