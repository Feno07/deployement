 Rails.application.config.middleware.use OmniAuth::Builder do
   provider :facebook, Rails.application.credentials.facebook[:api_key], Rails.application.credentials.facebook[:api_secret],
   {:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
 end