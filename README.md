# Kubernetes Development Environment

This is a [Pulumi](https://www.pulumi.com/) project that does the following:

- Provisions AWS infrastructure
  - ec2 instance
  - security group
  - ssh keypair

- Creates [k3d](https://k3d.io/) cluster on the ec2 instance
- Sets up the cluster for remote access from your local machine

This is built on and for macOS

## Dependencies

The following dependencies are required to run this:

- go `1.19`

- [pulumi cli](https://www.pulumi.com/docs/get-started/install/) -- `brew install pulumi`

- [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) -- this must be [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) to interact with an AWS account

- [jq](https://stedolan.github.io/jq/download/) -- `brew install jq`

- gsed -- `brew install gsed`

- ssh keypair at `~/.ssh/id_rsa` `~/.ssh/id_rsa.pub` -- can be generated by using `ssh-keygen` and following the prompts

## Usage

Clone the repository

```bash
git clone https://github.com/lucasrod16/ec2-k3d.git
```

List Makefile targets

```bash
make help
```

Create AWS infrastructure and k3d cluster

```bash
make all
```

Tear down AWS infrastructure

```bash
make destroy
```
