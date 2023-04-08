# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  # HACK: Required to foce load env vars
  require 'dotenv/load'
end

Rails.logger.debug 'Deleting data ...'

ActiveRecord::Base.connection.execute('DELETE FROM languages')
ActiveRecord::Base.connection.execute('DELETE FROM active_storage_variant_records')
ActiveRecord::Base.connection.execute('DELETE FROM active_storage_attachments')
ActiveRecord::Base.connection.execute('DELETE FROM active_storage_blobs')

################################################################################################
#
# LANGUAGES
#
################################################################################################

Rails.logger.debug 'Creating languages ...'

progres_create_languages = ProgressBar.create(title: 'Creating languages', total: 2)

Language.create!(uid: SecureRandom.uuid, name_en: 'Spanish', name_es: 'Español', iso_code_639_1: 'es', locale: 'es')
progres_create_languages.increment

Language.create!(uid: SecureRandom.uuid, name_en: 'English', name_es: 'Inglés', iso_code_639_1: 'en', locale: 'en')
progres_create_languages.increment
