# S3 Browser CLI

A command-line utility to select S3 keys interactively.

## Installation

### NPM

`npx s3-browser-cli`

### Nix

## Synopsis

`s3select [options]`

### Options

- `--bucket <bucket-name>`: A bucket to pre-select. When specifying the bucket parameter with the name of a valid S3 account owned by your AWS account, the inquirer-s3 module will start to browse at the root of this bucket.
- `--objectPrefix <key>`: An S3 object prefix indicating where you'd like to start the browsing inside a bucket.
- `--enableFolderSelect`: If set, the user is allowed to select an S3 *folder* prefix as a valid result, default false.
- `--enableFileObjectSelect`: If set, the user is allowed to select an S3 object (*files*) as a valid result, default true.
- `--enableOtherBuckets`: If set, the user should be allowed to navigate to buckets other than the bucket parameter specified, default true.

Note: It is invalid to pass an *objectPrefix* without specifying a valid bucket.   
Note: The *objectPrefix* must be a *folder*, i.e. a key's prefix not the full object's key.

## Usage

```bash
TMP_FILE=$(mktemp)
s3select 3>$TMP_FILE

SELECTED_S3_KEY=$(echo $TMP_FILE | jq -r '.prefix')
```

**Why is getting the output so difficult?**

This tool uses *inquirer-s3* under the hood which depends on an old version of *inquirer*.
In new versions of inquirer, there is a [fix](https://github.com/pnp/cli-microsoft365/issues/5489) to this problem and inquirer uses stderr insted of stdout.
We work around this limitation by using our custom file description with number 3.