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

ActiveRecord::Base.connection.execute('DELETE FROM companies')
ActiveRecord::Base.connection.execute('DELETE FROM users')
ActiveRecord::Base.connection.execute('DELETE FROM taxes')
ActiveRecord::Base.connection.execute('DELETE FROM currencies')
ActiveRecord::Base.connection.execute('DELETE FROM countries')
ActiveRecord::Base.connection.execute('DELETE FROM languages')
ActiveRecord::Base.connection.execute('DELETE FROM active_storage_variant_records')
ActiveRecord::Base.connection.execute('DELETE FROM active_storage_attachments')
ActiveRecord::Base.connection.execute('DELETE FROM active_storage_blobs')

# Initialize Fake with en language
Faker::Config.locale = 'en'

################################################################################################
#
# LANGUAGES
#
################################################################################################

Rails.logger.debug 'Creating languages ...'

Language.create!(uid: SecureRandom.uuid, name_en: 'Spanish', name_es: 'Español', iso_code_639_1: 'es', locale: 'es')
Language.create!(uid: SecureRandom.uuid, name_en: 'English', name_es: 'Inglés', iso_code_639_1: 'en', locale: 'en')

################################################################################################
#
# COUNTRIES
#
################################################################################################

Rails.logger.debug 'Creating countries ...'

spain = Country.create!(uid: SecureRandom.uuid, name_en: 'Spain', name_es: 'España', iso_code_3166_1: 'ES')
usa = Country.create!(uid: SecureRandom.uuid, name_en: 'United States', name_es: 'Estados Unidos', iso_code_3166_1: 'US')


################################################################################################
#
# CURRENCIES
#
################################################################################################

Rails.logger.debug 'Creating currencies ...'

euro = Currency.create!(uid: SecureRandom.uuid, name_en: 'Euro', name_es:'Euro', iso_code_4217: 'EUR', symbol: '€')
usd = Currency.create!(uid: SecureRandom.uuid, name_en: 'United States dollar', name_es: 'Dólar estadounidense', iso_code_4217: 'USD', symbol: '$')

################################################################################################
#
# TAXES
#
################################################################################################

Rails.logger.debug 'Creating taxes ...'

iva_10 = Tax.create!(uid: SecureRandom.uuid, code: 'IVA10', name_en: 'I.V.A. 10%', name_es: 'I.V.A. 10%', rate: 10)
iva_21 = Tax.create!(uid: SecureRandom.uuid, code: 'IVA21', name_en: 'I.V.A. 21%', name_es: 'I.V.A. 21%', rate: 21)
irpf = Tax.create!(uid: SecureRandom.uuid, code: 'IRPF15', name_en: 'I.R.P.F. 15%', name_es: 'I.R.P.F. 15%', rate: 15)


###############################################################################################
#
# USERS
#
################################################################################################

Rails.logger.debug 'Creating users ...'

admin_user = User.new(
  email: 'admin@local',
  password: 'hrQbE9wDRsdPThZpcUEP',
  password_confirmation: 'hrQbE9wDRsdPThZpcUEP',
  confirmed_at: DateTime.now)

admin_user.skip_confirmation_notification!
admin_user.save!


################################################################################################
#
# COMPANIES
#
################################################################################################

Rails.logger.debug 'Creating companies ...'

Faker::Alphanumeric.unique.clear
Faker::Company.unique.clear
Faker::Finance.unique.clear

company_1 = Company.create!(
    code: Faker::Alphanumeric.unique.alphanumeric(number: 3, min_numeric: 3),
    name: Faker::Company.unique.name,
    vat_number: Faker::Finance.unique.vat_number,
    notes: Faker::Lorem.paragraph,
    created_by: admin_user,
    updated_by: admin_user)

company_2 = Company.create!(
    code: Faker::Alphanumeric.unique.alphanumeric(number: 3, min_numeric: 3),
    name: Faker::Company.unique.name,
    vat_number: Faker::Finance.unique.vat_number,
    notes: Faker::Lorem.paragraph,
    created_by: admin_user,
    updated_by: admin_user)

company_3 = Company.create!(
    code: Faker::Alphanumeric.unique.alphanumeric(number: 3, min_numeric: 3),
    name: Faker::Company.unique.name,
    vat_number: Faker::Finance.unique.vat_number,
    notes: Faker::Lorem.paragraph,
    created_by: admin_user,
    updated_by: admin_user)
    
