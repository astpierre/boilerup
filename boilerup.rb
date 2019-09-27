require 'aws-sdk-s3'

s3 = Aws::S3::Resource.new(region:'us-west-2')
obj = s3.bucket('boilerup').object('python3-default')
obj.upload_file('./main.py')
