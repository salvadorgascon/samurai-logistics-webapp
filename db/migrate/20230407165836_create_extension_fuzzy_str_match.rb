class CreateExtensionFuzzyStrMatch < ActiveRecord::Migration[7.0]
  def change
    enable_extension "fuzzystrmatch" unless extension_enabled?('fuzzystrmatch')
  end
end
