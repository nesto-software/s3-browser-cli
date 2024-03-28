#!/usr/bin/env bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

install -d "${SCRIPT_DIR}/../node2nix"
(nix run nixpkgs#node2nix -- -18 --pkg-name nodejs_18 --development --input "${SCRIPT_DIR}/../../package.json" -e "${SCRIPT_DIR}/../node2nix/node-env.nix" -o "${SCRIPT_DIR}/../node2nix/node-packages.nix" -c "${SCRIPT_DIR}/../node2nix/default.nix")