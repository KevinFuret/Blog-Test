CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAIRFYDN2ENBLZO7OQ',                        # required
      aws_secret_access_key: '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',                        # required
      region:                'eu-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'blog-shareit'                                   # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end