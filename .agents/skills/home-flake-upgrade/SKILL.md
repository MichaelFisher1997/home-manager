---
name: home-flake-upgrade
description: Update this Home Manager flake and run home-upgrade for the current device when asked to update Nix flake inputs and upgrade the home configuration.
---

# Home flake upgrade

Use this workflow when asked to update this repository's Nix flake and apply
the Home Manager configuration on the current device. Do not run it merely
because this skill exists.

1. Check `git status --short` and note any existing changes, especially to
   `flake.lock`. Preserve unrelated work. The requested flake update will
   modify the lock file; never reset or discard pre-existing changes.
2. Check the current hostname and the `homeConfigurations` in `flake.nix`.
   Inspect the `home-upgrade` alias in `fish/fish.nix` or `zsh/zsh.nix`: it
   targets `$HOME/nixos/home-manager` and uses the configured `vars.hostName`.
   Confirm that path resolves to this checkout and that the current device
   maps to the intended configuration. If the path or host is ambiguous, ask
   the user before updating or switching; do not assume `hypr-nix`.
3. From the repository root, run `nix flake update`. If it fails, report the
   error and stop; do not switch with an incompletely updated flake.
4. Run `home-upgrade --max-jobs 4 --cores 6` if the configured alias is
   available. Shell aliases are often unavailable in non-interactive
   execution; in that case run the equivalent command with the verified host:

   ```sh
   home-manager switch --flake "path:$HOME/nixos/home-manager#<verified-host>" --max-jobs 4 --cores 6
   ```

   Replace `<verified-host>` with the actual configuration name. Do not use
   `sudo`, run a NixOS system upgrade, or switch a different device.
5. Report the target host, whether the update and switch succeeded, any
   relevant warnings or failures, and the resulting `flake.lock` changes.
   Do not commit or push unless explicitly requested.
