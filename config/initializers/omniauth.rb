Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'], scope: 'public_profile', info_fields: 'email, name, age_range, birthday, gender'
end
