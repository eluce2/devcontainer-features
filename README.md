# Dev Container Features

## `agent-browser`

Installs [agent-browser](https://agent-browser.dev/) CLI and Chromium.

> **Note:** Requires Node.js to be available in the container.

### Usage

```jsonc
{
    "features": {
        "ghcr.io/eluce2/devcontainer-features/agent-browser:1": {}
    }
}
```

### Options

| Option | Default | Description |
|--------|---------|-------------|
| `version` | `latest` | Version of agent-browser to install |
