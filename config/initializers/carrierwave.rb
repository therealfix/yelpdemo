# From https://github.com/carrierwaveuploader/carrierwave
#test ben's hack
require 'rubygems' 
require 'excon' 
Excon.ssl_verify_peer = false 

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['aws_access_key_id'],                        # required
    aws_secret_access_key: ENV['aws_secret_access_key'],  # required
    :region => 'us-east-1' # test alex's workaround though it is set to us-eat-1 by default anyways
  }
                          #Bucket name from aws
  config.fog_directory  = ENV['fog_directory']                          # required
end
