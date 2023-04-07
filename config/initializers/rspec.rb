Rails.application.config.generators do |g|
    g.test_framework :rspec,
    :fixtures => true,
    :view_specs => true,
    :helper_specs => true,
    :routing_specs => true,
    :controller_specs => true,
    :request_specs => true
  end