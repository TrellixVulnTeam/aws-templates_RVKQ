# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX - License - Identifier: Apache - 2.0

# Purpose
# This code example demonstrates how to set the default encryption state for an
# Amazon Simple Storage Service (Amazon S3) bucket using server-side encryption (SSE)
# with an AWS KMS customer master key (CMK).

# snippet-start:[s3.ruby.s3_add_default_sse_encryption]

require 'aws-sdk-s3'

# Sets the default encryption state for an Amazon S3 bucket using
#   server-side encryption (SSE) with an
#   AWS KMS customer master key (CMK).
#
# Prerequisites:
#
# - An Amazon S3 bucket.
# - An AWS KMS CMK.
#
# @param s3_client [Aws::S3::Client] An initialized Amazon S3 client.
# @param bucket_name [String] The name of the bucket.
# @param kms_master_key_id [String] The ID of the CMK.
# @return [Boolean] true if the default encryption state was
#   successfully set; otherwise, false.
# @example
#   exit 1 unless default_bucket_encryption_sse_cmk_set?(
#     Aws::S3::Client.new(region: 'us-west-2'),
#     'doc-example-bucket',
#     '9041e78c-7a20-4db3-929e-828abEXAMPLE'
#   )
def default_bucket_encryption_sse_cmk_set?(
  s3_client,
  bucket_name,
  kms_master_key_id
)
  s3_client.put_bucket_encryption(
    bucket: bucket_name,
    server_side_encryption_configuration: {
      rules: [
        {
          apply_server_side_encryption_by_default: {
            sse_algorithm: 'aws:kms',
            kms_master_key_id: kms_master_key_id
          }
        }
      ]
    }
  )
  return true
rescue StandardError => e
  puts "Error setting default encryption state: #{e.message}"
  return false
end

# Replace us-west-2 with the AWS Region you're using for Amazon S3.
def run_me
  bucket_name = 'doc-example-bucket'
  kms_master_key_id = '9041e78c-7a20-4db3-929e-828abEXAMPLE'
  region = 'us-west-2'
  s3_client = Aws::S3::Client.new(region: region)

  if default_bucket_encryption_sse_cmk_set?(
    s3_client,
    bucket_name,
    kms_master_key_id
  )
    puts 'Default encryption state set.'
  else
    puts 'Default encryption state not set.'
  end
end

run_me if $PROGRAM_NAME == __FILE__
# snippet-end:[s3.ruby.s3_add_default_sse_encryption]
