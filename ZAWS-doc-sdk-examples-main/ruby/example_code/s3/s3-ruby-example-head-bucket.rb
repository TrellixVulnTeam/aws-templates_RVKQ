# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX - License - Identifier: Apache - 2.0

# Purpose
# This code example demonstrates how to determine whether an Amazon Simple Storage Service (Amazon S3)
#  bucket exists and you have permission to access it.

# snippet-start:[s3.ruby.s3-ruby-example-head-bucket]
require 'aws-sdk-s3'

# Determines whether an Amazon Simple Storage Service (Amazon S3)
#   bucket exists and you have permission to access it.
#
# Prerequisites:
#
# - An S3 bucket.
#
# @param
# @param
# @return [Boolean] true if the bucket exists and you have permission to
#   access it; otherwise, false.
# @example
#   exit 1 unless bucket_exists_and_accessible?(
#     Aws::S3::Client.new(region: 'us-west-2'),
#     'doc-example-bucket'
#   )
def bucket_exists_and_accessible?(s3_client, bucket_name)
  s3_client.head_bucket(bucket: bucket_name)
  return true
rescue StandardError
  return false
end

# Full example call:
# Replace us-west-2 with the AWS Region you're using for Amazon S3.
def run_me
  bucket_name = 'doc-example-bucket'
  region = 'us-west-2'
  s3_client = Aws::S3::Client.new(region: region)

  if bucket_exists_and_accessible?(s3_client, bucket_name)
    puts "Bucket '#{bucket_name}' exists and is accessible to you."
  else
    puts "Bucket '#{bucket_name}' does not exist " \
      'or is not accessible to you.'
  end
end

run_me if $PROGRAM_NAME == __FILE__
# snippet-end:[s3.ruby.s3-ruby-example-head-bucket]
