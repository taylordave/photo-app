# if Rails.env.production?
  CarrierWave.configure do | config |
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.dig(:s3_bucket, :aws_access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:s3_bucket, :aws_secret_access_key),
      region: 'us-east-1'
    }
    config.fog_directory = Rails.application.credentials.dig(:s3_bucket, :bucket_name)
    config.fog_public = false
    config.storage = :fog
  end
# end