# Home Manager Configuration - Agent Guidelines

## Build/Test Commands
- **Build configuration**: `home-manager switch --flake .#micqdf`
- **Check configuration**: `home-manager build --flake .#micqdf`
- **Upgrade system**: `home-upgrade` (alias defined in fish.nix:37)

## Code Style Guidelines

### Nix Files
- Use 2-space indentation consistently
- Follow functional Nix patterns with proper attribute set syntax
- Import modules at top of files using relative paths
- Use descriptive attribute names (e.g., `programs.fish.enable = true`)
- Group related configurations together
- Use `lib.hm.dag.entryAfter` for activation scripts when needed

### File Organization
- Main configuration in `home.nix` with imports for modules
- Separate concerns into dedicated modules (fish/, nvim/, alacritty/, etc.)
- Use consistent naming: `{program}.nix` for program configurations
- Place shell-specific files in respective directories (fish/functions/, fish/themes/)

### Configuration Patterns
- Enable programs with `programs.{program}.enable = true`
- Use `home.file` for custom config files with `recursive = true` for directories
- Set session variables in `home.sessionVariables`
- Define shell aliases in respective shell configurations
- Use `xdg.mimeApps` for default application associations

### Git Conventions
- User: "MichaelFisher1997", Email: "contact@michaelfisher.tech"
- Use aliases: `pu` (push), `co` (checkout), `cm` (commit)

## Testing
- Test changes by running `home-manager switch --flake .#micqdf`
- Verify configurations are applied correctly in respective applications
- Check for syntax errors before committing