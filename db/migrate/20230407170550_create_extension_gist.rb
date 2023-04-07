class CreateExtensionGist < ActiveRecord::Migration[7.0]
  def change
    enable_extension "btree_gist" unless extension_enabled?('btree_gist')
  end
end
