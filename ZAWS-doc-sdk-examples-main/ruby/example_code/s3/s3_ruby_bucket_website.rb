# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX - License - Identifier: Apache - 2.0

# Purpose
# This code example demonstrates how to configure an Amazon Simple Storage Service (Amazon S3) bucket as a static website.

# snippet-start:[s3.s3_ruby_bucket_website.rb]

require 'aws-sdk-s3'

# Prerequisites:
#
# - An Amazon S3 bucket.
# - A file in the bucket representing the website's home or
#     default page.
# - A file in the bucket representing the website's error page.
#
# @param s3_client [Aws::S3::Client] An initialized Amazon S3 client.
# @param bucket_name [String] The name of the bucket.
# @param index_document [String] The file name of the home or default page
#   of the website.
# @param error_document [String] The file name of the page returned when a
#   website error occurs.
# @return [Boolean] true if the bucket was successfully configured;
#   otherwise, false.
# @example
#   exit 1 unless bucket_website_configured?(
#     Aws::S3::Client.new(region: 'us-west-2'),
#     'doc-example-bucket',
#     'index.html',
#     '404.html'
#   )
def bucket_website_configured?(
  s3_client,
  bucket_name,
  index_document,
  error_document
)
  s3_client.put_bucket_website(
    bucket: bucket_name,
    website_configuration: {
      index_document: {
        suffix: index_document
      },
      error_document: {
        key: error_document
      }
    }
  )
  return true
rescue StandardError => e
  puts "Error configuring bucket as a static website: #{e.message}"
  return false
end

# Replace us-west-2 with the AWS Region you're using for Amazon S3.

def run_me
  bucket_name = 'doc-example-bucket'
  index_document = 'index.html'
  error_document = '404.html'
  region = 'us-west-2'
  s3_client = Aws::S3::Client.new(region: region)

  if bucket_website_configured?(
    s3_client,
    bucket_name,
    index_document,
    error_document
  )
    puts 'Bucket configured as a static website.'
  else
    puts 'Bucket not configured as a static website.'
  end
end

run_me if $PROGRAM_NAME == __FILE__
# snippet-end:[s3.s3_ruby_bucket_website.rb]
