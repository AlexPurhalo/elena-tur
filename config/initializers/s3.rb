if Rails.env == "production"
  # set credentials from ENV hash
  S3_CREDENTIALS = { access_key_id: ENV['AKIAI7VDKMUPXYEMZZUA'],
                     secret_access_key: ENV['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'],
                     bucket: 'elena-tour'}
else
  # get credentials from YML file
  S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end