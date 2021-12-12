# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# Purpose
# This code demonstrates how to copy an object from one Amazon Simple Storage Service (Amazon S3) bucket to another.

# snippet-start:[s3.ruby.copy_object_between_buckets.rb]
require 'aws-sdk-s3'

# Prerequisites:
#
# - Two Amazon S3 buckets (a source bucket and a target bucket).
# - An object in the source bucket to be copied.
#
# @param s3_client [Aws::S3::Client] An initialized Amazon S3 client.
# @param source_bucket_name [String] The source bucket's name.
# @param source_key [String] The name of the object
#   in the source bucket to be copied.
# @param target_bucket_name [String] The target bucket's name.
# @param target_key [String] The name of the copied object.
# @return [Boolean] true if the object was copied; otherwise, false.
# @example
#   s3_client = Aws::S3::Client.new(region: 'us-west-2')
#   exit 1 unless object_copied?(
#     s3_client,
#     'doc-example-bucket1',
#     'my-source-file.txt',
#     'doc-example-bucket2',
#     'my-target-file.txt'
#   )
def object_copied?(
  s3_client,
  source_bucket_name,
  source_key,
  target_bucket_name,
  target_key)

  return true if s3_client.copy_object(
    bucket: target_bucket_name,
    copy_source: source_bucket_name + '/' + source_key,
    key: target_key
  )
rescue StandardError => e
  puts "Error while copying object: #{e.message}"
end

# Full example call:
# Replace us-west-2 with the AWS Region you're using for Amazon S3.
def run_me
  source_bucket_name = 'doc-example-bucket1'
  source_key = 'my-source-file.txt'
  target_bucket_name = 'doc-example-bucket2'
  target_key = 'my-target-file.txt'
  region = 'us-west-2'

  s3_client = Aws::S3::Client.new(region: region)

  puts "Copying object '#{source_key}' from bucket '#{source_bucket_name}' " \
    "to bucket '#{target_bucket_name}'..."

  if object_copied?(
    s3_client,
    source_bucket_name,
    source_key,
    target_bucket_name,
    target_key)
    puts 'The object was copied.'
  else
    puts 'The object was not copied. Stopping program.'
    exit 1
  end
end

run_me if $PROGRAM_NAME == __FILE__
# snippet-end:[s3.ruby.copy_object_between_buckets.rb]
