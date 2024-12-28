# Oh My Zsh Plugin Installation Script

This is a quick installation script for Oh My Zsh, including the zsh-auto-suggestions and zsh-syntax-highlighting plugins.

Oh My Zsh is a community-driven framework for managing zsh configuration. It allows you to install many efficient plugins, themes, and more. However, two popular plugins, `zsh-auto-suggestions` and `zsh-syntax-highlighting`, are not directly included in Oh My Zsh. Therefore, this installation script has been modified to enable one-click installation.

## Usage

### Online Installation

Depending on your network environment and preferred `HTTP` command-line tool, choose one of the following methods for installation:

1. Install from Gitee mirror repository (recommended for China):

| Method    | Command                                                                                             |
| :-------- | :-------------------------------------------------------------------------------------------------- |
| **curl**  | `sh -c "$(curl -fsSL https://gitee.com/jinzcdev/ohmyzsh-with-plugins/raw/main/install_ohmyzsh.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://gitee.com/jinzcdev/ohmyzsh-with-plugins/raw/main/install_ohmyzsh.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://gitee.com/jinzcdev/ohmyzsh-with-plugins/raw/main/install_ohmyzsh.sh)"` |

2. Install from GitHub:

| Method    | Command                                                                                                         |
| :-------- | :-------------------------------------------------------------------------------------------------------------- |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/jinzcdev/ohmyzsh-with-plugins/main/install_ohmyzsh.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/jinzcdev/ohmyzsh-with-plugins/main/install_ohmyzsh.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/jinzcdev/ohmyzsh-with-plugins/main/install_ohmyzsh.sh)"` |

### Local Installation

Clone the project or create the script file locally, then run the following command:

```sh
sh install_ohmyzsh.sh
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

## Uninstall Oh My Zsh

Run `uninstall_oh_my_zsh` in the command line, which will automatically remove and restore your previous bash or zsh configuration.

## License

This project is licensed under the MIT License. For more details, please refer to the [LICENSE](./LICENSE) file.

## Related Links

1. [Oh My Zsh Official Repository](https://github.com/ohmyzsh/ohmyzsh)
2. [zsh-syntax-highlighting Official Repository](https://github.com/zsh-users/zsh-syntax-highlighting)
3. [zsh-autosuggestions Official Repository](https://github.com/zsh-users/zsh-autosuggestions)
