# Oh My Zsh Plugin Installation Script

This is a quick installation script for Oh My Zsh, including the zsh-auto-suggestions and zsh-syntax-highlighting plugins.

Oh My Zsh is a community-driven framework for managing zsh configuration. It allows you to install many efficient plugins, themes, and more. However, two popular plugins, `zsh-auto-suggestions` and `zsh-syntax-highlighting`, are not directly included in Oh My Zsh. Therefore, this installation script has been modified to enable one-click installation.

## Usage

### Local Installation

Clone the project or create the script file locally, then run the following command:

```sh
sh install_ohmyzsh_custom.sh
```

### Online Installation

1. Install from Gitee mirror repository (recommended):

```sh
curl -sSL https://gitee.com/jinzcdev/ohmyzsh-with-plugins/raw/main/install_ohmyzsh_custom.sh | sh
```

2. Install from GitHub:

```sh
curl -sSL https://raw.githubusercontent.com/jinzcdev/ohmyzsh-with-plugins/main/install_ohmyzsh_custom.sh | sh
```

## Dependencies

Before running the script, make sure the following dependencies are installed:

-   `git`
-   `zsh`

Depending on the operating system, you can use different package managers to install the above dependencies:

| Operating System | Package Manager | Installation Command                          |
| ---------------- | --------------- | --------------------------------------------- |
| Debian/Ubuntu    | apt             | `sudo apt update && sudo apt install git zsh` |
| CentOS/RHEL      | yum             | `sudo yum install git zsh`                    |
| macOS            | brew            | `brew install git zsh`                        |

## License

This project is licensed under the MIT License. For more details, please refer to the [LICENSE](./LICENSE) file.
