#!/usr/bin/env bash
# Supply the cache before activation makes nix.settings take effect.
exec sudo nixos-rebuild switch --flake ~/nixos/#laptop --impure \
  --option extra-substituters https://cache.nixos-cuda.org \
  --option extra-trusted-public-keys cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M= "$@"
