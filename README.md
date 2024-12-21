# Oh My Zsh 插件安装脚本

这是一个快速安装 Oh My Zsh 的脚本，同时包含 zsh-auto-suggestions 和 zsh-syntax-highlighting 插件。

Oh My Zsh 是一个社区驱动的框架，用于管理 zsh 配置。可以安装许多高效的插件、主题等。但是其中两个热门插件 `zsh-auto-suggestions` 和 `zsh-syntax-highlighting` 并没有直接包含在 Oh My Zsh 中，所以将其安装脚本进行了修改，使其可以一键安装。

## 使用方法

### 本地安装

克隆该项目或者在本地直接创建脚本文件后，执行以下命令：

```sh
sh install_ohmyzsh_custom.sh
```

### 在线安装

1. 从 Gitee 镜像仓库安装（**推荐**）：

```sh
curl -sSL https://gitee.com/jinzcdev/ohmyzsh-with-plugins/raw/main/install_ohmyzsh_custom.sh | sh
```

2. 从 GitHub 安装：

```sh
curl -sSL https://raw.githubusercontent.com/jinzcdev/ohmyzsh-with-plugins/main/install_ohmyzsh_custom.sh | sh
```

## 依赖项

在运行脚本之前，请确保已安装以下依赖项：

-   `git`
-   `zsh`

根据不同操作系统，可使用不同的包管理器安装上述依赖项：

| 操作系统      | 包管理器 | 安装命令                                      |
| ------------- | -------- | --------------------------------------------- |
| Debian/Ubuntu | apt      | `sudo apt update && sudo apt install git zsh` |
| CentOS/RHEL   | yum      | `sudo yum install git zsh`                    |
| macOS         | brew     | `brew install git zsh`                        |

## 许可证

此项目使用 MIT 许可证。有关详细信息，请参阅 [LICENSE](./LICENSE) 文件。
