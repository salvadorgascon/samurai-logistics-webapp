class CreateExtensionGin < ActiveRecord::Migration[7.0]
  def change
    enable_extension "btree_gin" unless extension_enabled?('btree_gin')
  end
end
