require 'aws-sdk-s3'

s3 = Aws::S3::Resource.new(region:'us-west-2')
obj = s3.bucket('boilerup').object('ruby-module')
obj.upload_file('./main.rb')
