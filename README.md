# CoWSwap (Fee-Free Fork)

This is a patched version of [CoWSwap](https://github.com/cowprotocol/cowswap) with partner/volume fees removed.

## What's Changed

Patches are in `patches/` directory:
- `disable-volume-fee.patch` - Makes `volumeFeeAtom` return `undefined`, disabling:
  - Safe App License Fee
  - Widget Partner Fee
  - Any other volume-based fees
- `branding.patch` - Updates app code and title to "CoW Swap - No Rent"
- `fork-announcement.patch` - Adds a banner explaining this is an unofficial fork

## How It Works

The GitHub Actions workflow:
1. Checks daily for new upstream `cowswap-v*` releases
2. Fetches the upstream tag
3. Applies patches via `git apply`
4. Builds and deploys to GitHub Pages

If a patch fails to apply (upstream changed the file structure), the build will fail clearly, alerting you to update the patch.

## Manual Deployment

Trigger a manual deployment from the Actions tab. You can optionally specify a specific upstream tag to build.

## Local Development

This repo includes a Nix flake for development:

```bash
# Enter the dev shell (requires Nix with flakes)
nix develop

# Or with direnv
direnv allow
```

## Upstream

- Repository: https://github.com/cowprotocol/cowswap
- Latest release: Check `.last-built-tag` for the currently deployed version
