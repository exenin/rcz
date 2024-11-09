# RCZ - Development Environment Bootstrap

A robust development environment setup tool that automatically configures your Unix-like system (macOS/Linux) with essential development tools and configurations.

## Features

- 🚀 Quick setup of development environment
- 🛠 Automated tool installation (git, vim, curl, wget, etc.)
- ⚙️ Configurable development paths and settings
- 🔄 Cross-platform support (macOS and Linux)
- 🔒 Secure default configurations
- ☁️ Cloud tools support (GCloud, kubectl)
- 🔄 GitLab integration

## Quick Start

```bash
# Clone the repository
git clone https://github.com/exenin/rcz ~/.rcz
cd ~/.rcz

# Source the environment
source sourceme

# Run the setup
bin/setup
```

## Directory Structure

```
.rcz/
├── bin/                  # Executable scripts
│   ├── install
│   ├── install-tools
│   └── setup
├── scripts/
│   ├── core/            # Core functionality
│   │   ├── aliases.sh
│   │   ├── envs.sh
│   │   ├── functions.sh
│   │   ├── help.sh
│   │   └── paths.sh
│   ├── cloud/           # Cloud provider tools
│   │   └── gcloud.sh
│   ├── gitlab/          # GitLab integration
│   │   ├── docker-login.sh
│   │   ├── helm-login.sh
│   │   └── admin-token.sh
│   └── tools/           # Development tools
│       ├── devtools.sh
│       └── kubez.sh
├── .gitignore
├── README.md
└── sourceme            # Main entry point
```

## Available Commands

Run `rcz_help` to see all available commands and aliases.

### Common Commands

- Development: `mkcd`, `extract`, `gclone`
- Docker: `d`, `dc`, `dps`, `di`, `dexec`
- Kubernetes: `k`, `kgp`, `kgs`, `kgn`, `kexec`
- Cloud: `gcl`, `gcp`, `gca`, `gcr`
- GitLab: `gitlab_docker_login`, `gitlab_helm_login`

## Configuration

The environment can be customized by modifying:
- `scripts/core/envs.sh` - Environment variables
- `scripts/core/aliases.sh` - Command aliases
- `scripts/core/functions.sh` - Helper functions

## Requirements

- Unix-like operating system (macOS or Linux)
- Bash shell
- Git
- Internet connection for downloading tools

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT License - See [LICENSE](LICENSE) for details


