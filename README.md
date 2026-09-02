# claude-settings

User-wide [Claude Code](https://docs.anthropic.com/en/docs/claude-code) settings, and a setup script that installs them into a [Claude Code on the web](https://docs.anthropic.com/en/docs/claude-code/claude-code-on-the-web) environment.

## Files

- `settings.json` — the user-wide settings file. Installed to `~/.claude/settings.json`.
- `setup.sh` — environment setup script that downloads `settings.json` from this repo into place.

## Usage on Claude Code on the web

Configure your environment's setup script in one of two ways:

1. Paste the contents of [`setup.sh`](setup.sh) into the environment's setup script field, or
2. Use a one-liner that fetches the script from this repo:

   ```sh
   curl -fsSL https://raw.githubusercontent.com/cblecker/claude-settings/main/setup.sh | bash
   ```

Either way, every new session starts with the current `settings.json` from `main` at `~/.claude/settings.json`. An existing file is always overwritten.

### Overriding the source

Set `CLAUDE_SETTINGS_URL` to any URL `curl` understands (including `file://`) to install settings from a branch, fork, or local file:

```sh
CLAUDE_SETTINGS_URL=https://raw.githubusercontent.com/cblecker/claude-settings/my-branch/settings.json ./setup.sh
```

## CI

- `setup.sh` is checked with `bash -n` and [shellcheck](https://www.shellcheck.net/).
- `settings.json` is checked for valid JSON and validated against the [Claude Code settings schema](https://json.schemastore.org/claude-code-settings.json). Keep the `$schema` key so editors get the same validation.

## License

[MIT](LICENSE)
