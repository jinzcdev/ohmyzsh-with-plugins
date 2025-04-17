# Oh My Zsh 插件安装脚本

<div align="center">
    <img src="https://ohmyz.sh/img/OMZLogo_BnW.png" alt="Oh My Zsh Logo" width="35%" />
    <div>
        <a href="README.md"><img src="https://img.shields.io/badge/English-Click-yellow" alt="English" /></a>
        <a href="README_zh-CN.md"><img src="https://img.shields.io/badge/简体中文-点击查看-orange" alt="简体中文" /></a>
    </div>
</div>

这是一个快速安装 Oh My Zsh 的脚本，附带了 zsh-auto-suggestions 和 zsh-syntax-highlighting 插件。

Oh My Zsh 是一个社区驱动的框架，用于管理 zsh 配置，且可以安装许多高效的插件、主题等。但是其中两个热门插件 `zsh-auto-suggestions` 和 `zsh-syntax-highlighting` 并没有直接包含在 Oh My Zsh 中，所以将其安装脚本进行了修改，使其可以一键安装。

## 使用方法

### 在线安装

根据你的网络环境和常用的 `HTTP` 命令行工具，选择以下任意一种方式进行安装：

1. 从 Gitee 镜像仓库安装（**国内推荐**）：

| 方式      | 命令                                                                                                |
| :-------- | :-------------------------------------------------------------------------------------------------- |
| **curl**  | `sh -c "$(curl -fsSL https://gitee.com/jinzcdev/ohmyzsh-with-plugins/raw/main/install_ohmyzsh.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://gitee.com/jinzcdev/ohmyzsh-with-plugins/raw/main/install_ohmyzsh.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://gitee.com/jinzcdev/ohmyzsh-with-plugins/raw/main/install_ohmyzsh.sh)"` |

2. 从 GitHub 安装：

| 方式      | 命令                                                                                                            |
| :-------- | :-------------------------------------------------------------------------------------------------------------- |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/jinzcdev/ohmyzsh-with-plugins/main/install_ohmyzsh.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/jinzcdev/ohmyzsh-with-plugins/main/install_ohmyzsh.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/jinzcdev/ohmyzsh-with-plugins/main/install_ohmyzsh.sh)"` |

### 本地安装

克隆该项目或者在本地直接创建脚本文件后，执行以下命令：

```sh
sh install_ohmyzsh.sh
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

## 卸载 Oh My Zsh

在命令行中运行 `uninstall_oh_my_zsh`，该命令将会自动移除并恢复你之前的 bash 或 zsh 配置。

## 许可证

此项目使用 MIT 许可证。有关详细信息，请参阅 [LICENSE](./LICENSE) 文件。

## 相关链接

1. [Oh My Zsh 官方仓库](https://github.com/ohmyzsh/ohmyzsh)
2. [zsh-syntax-highlighting 官方仓库](https://github.com/zsh-users/zsh-syntax-highlighting)
3. [zsh-autosuggestions 官方仓库](https://github.com/zsh-users/zsh-autosuggestions)
