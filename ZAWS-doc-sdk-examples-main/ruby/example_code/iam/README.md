# AWS SDK for Ruby code examples for IAM

## Purpose
This folder contains code examples that demonstrate how to use the AWS SDK for 
Ruby to automate AWS Identity and Access Management (IAM).

IAM is a web service for securely controlling access to AWS services. With IAM, you can
centrally manage users, security credentials such as access keys, and permissions that control 
which AWS resources users and applications can access.

## Code examples 

### Usage examples
- [Construct a URL for federated users](./iam-ruby-example-construct-url-federated-users.rb)
- [Manage access keys](./iam-ruby-example-access-keys.rb)
- [Manage account aliases](./iam-ruby-example-account-alias.rb)
- [Manage policies](./iam-ruby-example-manage-policies.rb)
- [Manage users](./iam-ruby-example-manage-users.rb)
- [Manage server certificates](./iam-ruby-example-server-certificates.rb)
- [Manage administrator privileges](./iam_ruby_example_show_admins.rb)

### API examples
- [Add a managed policy](./iam-ruby-example-add-managed-policy.rb)
- [Add a new user](./iam-ruby-example-add-new-user.rb)
- [Create a role](./iam-ruby-example-create-role.rb)
- [Create user access keys](./iam-ruby-example-create-user-access-keys.rb)
- [Get SSH public keys](./iam-ruby-example-get-ssh-public-keys.rb)
- [List all users](./iam-ruby-example-list-all-users.rb)


## Important

- As an AWS best practice, grant this code least privilege, or only the 
  permissions required to perform a task. For more information, see 
  [Grant least privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege) 
  in the *AWS Identity and Access Management User Guide*.
- This code has not been tested in all AWS Regions. Some AWS services are 
  available only in specific AWS Regions. For more information, see the 
  [AWS Regional Services List](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/)
  on the AWS website.
- Running this code might result in charges to your AWS account.

## Running the code

### Prerequisites

- An AWS account. To create an account, see [How do I create and activate a new AWS account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/) on the AWS Premium Support website.
- AWS credentials or an AWS Security Token Service (AWS STS) access token. For details, see 
  [Configuring the AWS SDK for Ruby](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html) in the 
  *AWS SDK for Ruby Developer Guide*.
- To run the code examples, Ruby version 1.9 or later. For Ruby download and installation instructions, see 
  [Download Ruby](https://www.ruby-lang.org/en/downloads/) on the Ruby Progamming Language website.
- To test the code examples, RSpec 3.9 or later. For RSpec download and installation instructions, see the [rspec/rspec](https://github.com/rspec/rspec) repository in GitHub.
- The AWS SDK for Ruby. For AWS SDK for Ruby download and installation instructions, see 
  [Install the AWS SDK for Ruby](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-install.html) in the 
  *AWS SDK for Ruby Developer Guide*.

Most of these code example files can be run with very little to no modification. For example, to use Ruby to run the `iam-ruby-example-add-new-user.rb` file, replace the hard-coded values in the file with your own values, save the file, and then run the file. For example:

```
ruby iam-ruby-example-add-new-user.rb
```

Most of these files have been refactored into reusable functions that can be copied into your own code. You can then call those functions directly from your own code without modifying the copied function code itself. For example, you could copy the `create_user` function code from the `iam-ruby-example-add-new-user.rb` file into your own code. You could then adapt the code in the `run_me` function in that same file as a basis to write your own code to call the copied `create_user` function.

## Running the tests

Most of these code example files have accompanying tests that are written to work with RSpec. These tests are in the `tests` folder and contain the same file name as the corresponding code example file, for example `tests/test_iam-ruby-example-add-new-user.rb` contains tests for `iam-ruby-example-add-new-user.rb`.

To use RSpec to run all tests within a file, specify the path to that file, for example:

```
rspec tests/test_iam-ruby-example-add-new-user.rb
```

To explore additional options for using RSpec to run tests, run the `rspec --help` command. 

Most of these tests are designed to use stubs, to avoid generating unnecessary costs in an AWS account. For more information, see [Stubbing Client Responses and Errors](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/stubbing.html) in the *AWS SDK for Ruby Developer Guide*.


## Additional information

- [AWS Identity and Access Management Documentation](https://docs.aws.amazon.com/iam)
- [AWS SDK for Ruby Documentation](https://docs.aws.amazon.com/sdk-for-ruby)
- [AWS Tools and SDKs Shared Configuration and Credentials Reference Guide](https://docs.aws.amazon.com/credref/latest/refdocs)
- [RSpec Documentation](https://rspec.info/documentation)

---
Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.

SPDX-License-Identifier: Apache-2.0
