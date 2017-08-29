Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    #Change to allow only front end host server 
    origins '*'
    resource '*',
      headers: :any,
      methods: %i(get post put patch delete options head)
  end
end