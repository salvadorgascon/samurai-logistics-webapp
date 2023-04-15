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

ActiveRecord::Base.connection.execute('DELETE FROM customers')
ActiveRecord::Base.connection.execute('DELETE FROM sales_people')
ActiveRecord::Base.connection.execute('DELETE FROM products')
ActiveRecord::Base.connection.execute('DELETE FROM brands')
ActiveRecord::Base.connection.execute('DELETE FROM colors')
ActiveRecord::Base.connection.execute('DELETE FROM cost_centers')
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
    uid: SecureRandom.uuid, 
    code: Faker::Alphanumeric.unique.alphanumeric(number: 3, min_numeric: 3),
    name: Faker::Company.unique.name,
    vat_number: Faker::Finance.unique.vat_number,
    notes: Faker::Lorem.paragraph,
    created_by: admin_user,
    updated_by: admin_user)

company_2 = Company.create!(
    uid: SecureRandom.uuid, 
    code: Faker::Alphanumeric.unique.alphanumeric(number: 3, min_numeric: 3),
    name: Faker::Company.unique.name,
    vat_number: Faker::Finance.unique.vat_number,
    notes: Faker::Lorem.paragraph,
    created_by: admin_user,
    updated_by: admin_user)

company_3 = Company.create!(
    uid: SecureRandom.uuid, 
    code: Faker::Alphanumeric.unique.alphanumeric(number: 3, min_numeric: 3),
    name: Faker::Company.unique.name,
    vat_number: Faker::Finance.unique.vat_number,
    notes: Faker::Lorem.paragraph,
    created_by: admin_user,
    updated_by: admin_user)
    

################################################################################################
#
# COST_CENTERS
#
################################################################################################

Rails.logger.debug 'Creating cost centers ...'

CostCenter.create!(uid: SecureRandom.uuid, code: '001', name: 'Cost Center 1', created_by: admin_user, updated_by: admin_user)
CostCenter.create!(uid: SecureRandom.uuid, code: '002', name: 'Cost Center 2', created_by: admin_user, updated_by: admin_user)
CostCenter.create!(uid: SecureRandom.uuid, code: '003', name: 'Cost Center 3', created_by: admin_user, updated_by: admin_user)

################################################################################################
#
# COLORS
#
################################################################################################

Rails.logger.debug 'Creating colors ...'

Color.create!(uid: SecureRandom.uuid, name: 'Amarillo',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Azul',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Blanco',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Gris',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Marron',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Naranja',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Negro',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Rojo',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Rosa',created_by: admin_user, updated_by: admin_user)
Color.create!(uid: SecureRandom.uuid, name: 'Verde',created_by: admin_user, updated_by: admin_user)

################################################################################################
#
# BRANDS
#
################################################################################################

Rails.logger.debug 'Creating brands ...'

Faker::Alphanumeric.unique.clear
Faker::Appliance.unique.clear

10.times do |i|
  brand = Brand.create!(
    uid: SecureRandom.uuid,
    code: Faker::Alphanumeric.unique.alphanumeric(number: 4),
    name: Faker::Appliance.unique.brand,
    created_by: admin_user,
    updated_by: admin_user)
end

brand_1 = Brand.all[1]
brand_2 = Brand.all[2]
brand_3 = Brand.all[3]


################################################################################################
#
# PRODUCTS
#
################################################################################################

Rails.logger.debug 'Creating products ...'

Faker::Alphanumeric.unique.clear
Faker::Commerce.unique.clear
Faker::Code.unique.clear

5.times do
  product = Product.create!(
    uid: SecureRandom.uuid,
    code: Faker::Alphanumeric.unique.alphanumeric(number: 10, min_alpha: 3, min_numeric: 7),
    name: Faker::Commerce.unique.product_name,
    barcode: Faker::Code.ean,
    barcode_type: :ean,
    brand: brand_1,
    unit_measure: :unit,
    is_component: true,
    short_description: Faker::Lorem.sentence,
    long_description: Faker::Lorem.paragraph,
    tags: Faker::Lorem.words(number: 4),
    created_by: admin_user, 
    updated_by: admin_user)
end

15.times do
  product = Product.create!(
    uid: SecureRandom.uuid,
    code: Faker::Alphanumeric.unique.alphanumeric(number: 10, min_alpha: 3, min_numeric: 7),
    name: Faker::Commerce.unique.product_name,
    barcode: Faker::Code.ean,
    barcode_type: :ean,
    brand: brand_2,
    unit_measure: :unit,
    is_component: true,
    short_description: Faker::Lorem.sentence,
    long_description: Faker::Lorem.paragraph,
    tags: Faker::Lorem.words(number: 4),
    created_by: admin_user, 
    updated_by: admin_user)
end

55.times do
  product = Product.create!(
    uid: SecureRandom.uuid,
    code: Faker::Alphanumeric.unique.alphanumeric(number: 10, min_alpha: 3, min_numeric: 7),
    name: Faker::Commerce.unique.product_name,
    barcode: Faker::Code.ean,
    barcode_type: :ean,
    unit_measure: :unit,
    is_component: true,
    short_description: Faker::Lorem.sentence,
    long_description: Faker::Lorem.paragraph,
    tags: Faker::Lorem.words(number: 4),
    created_by: admin_user,
    updated_by: admin_user)
end

product_component_1 = Product.all[1]
product_component_2 = Product.all[2]
product_component_3 = Product.all[3]

25.times do
  product = Product.create!(
    uid: SecureRandom.uuid,
    code: Faker::Alphanumeric.unique.alphanumeric(number: 10, min_alpha: 3, min_numeric: 7),
    name: Faker::Commerce.unique.product_name,
    barcode: Faker::Code.ean,
    barcode_type: :ean,
    unit_measure: :unit,
    is_assembled: true,
    short_description: Faker::Lorem.sentence,
    long_description: Faker::Lorem.paragraph,
    tags: Faker::Lorem.words(number: 4),
    created_by: admin_user, 
    updated_by: admin_user)  
end

product_assembled_1 = Product.where('is_assembled = true').all[1]
product_assembled_2 = Product.where('is_assembled = true').all[2]
product_assembled_3 = Product.where('is_assembled = true').all[3]

# TODO: Add images


################################################################################################
#
# SALES_PEOPLE
#
################################################################################################

Rails.logger.debug 'Creating sales people ...'

Faker::IDNumber.unique.clear
Faker::Internet.unique.clear
Faker::PhoneNumber.unique.clear

5.times do
  SalesPerson.create!(
    uid: SecureRandom.uuid,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    id_number: Faker::IDNumber.unique.spanish_citizen_number,
    email: Faker::Internet.unique.email,
    mobile: Faker::PhoneNumber.unique.cell_phone,
    notes: Faker::Lorem.paragraph,
    tags: Faker::Lorem.words(number: 4),
    created_by: admin_user,
    updated_by: admin_user)
end

sales_person_1 = SalesPerson.all[1]
sales_person_2 = SalesPerson.all[2]
sales_person_3 = SalesPerson.all[3]
sales_person_4 = SalesPerson.all[4]


################################################################################################
#
# CUSTOMERS
#
################################################################################################

Rails.logger.debug 'Creating customers ...'

Faker::Alphanumeric.unique.clear
Faker::Company.unique.clear
Faker::Finance.unique.clear
Faker::Name.unique.clear
Faker::Internet.unique.clear
Faker::PhoneNumber.unique.clear
Faker::Bank.unique.clear


95.times do
  customer = Customer.create!(
    uid: SecureRandom.uuid,
    code: Faker::Alphanumeric.unique.alphanumeric(number: 10, min_alpha: 1, min_numeric: 9),
    name: Faker::Company.unique.name,
    vat_number: Faker::Finance.unique.vat_number,
    notes: Faker::Lorem.paragraph,
    tags: Faker::Lorem.words(number: 4),
    created_by: admin_user,
    updated_by: admin_user)
end

customer_1 = Customer.all[1]
customer_2 = Customer.all[2]
customer_3 = Customer.all[3]

5.times do
  Customer.create!(
    uid: SecureRandom.uuid,
    code: Faker::Alphanumeric.unique.alphanumeric(number: 10, min_alpha: 1, min_numeric: 9),
    name: Faker::Company.unique.name,
    vat_number: Faker::Finance.unique.vat_number,
    notes: Faker::Lorem.paragraph,
    state: :archived,
    state_notes: Faker::Lorem.sentence,
    tags: Faker::Lorem.words(number: 4),
    created_by: admin_user,
    updated_by: admin_user)
end