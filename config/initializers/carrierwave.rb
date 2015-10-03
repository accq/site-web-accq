CarrierWave.configure do |config|
  if (Rails.env.development? || Rails.env.test?)
    config.storage = :file
  else    
    config.storage = :fog    
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :region                 => 'us-west-2',
      :aws_access_key_id      => ENV['aws_access_key_id'],
      :aws_secret_access_key  => ENV['aws_secret_access_key']
    }
    config.fog_directory  = 'accq'                          # required
    config.fog_public     = true                                        # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
  end
end