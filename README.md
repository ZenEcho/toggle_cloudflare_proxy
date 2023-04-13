# toggle_cloudflare_proxy
简单的实现Cloudflare小云朵开启关闭,Cloudflare的代理开启关闭

**注意设置脚本里的信息**
```bash
# 设置您的 Cloudflare API 密钥和账户 ID
api_key="Cloudflare API 密钥"
account_id="Cloudflare 账户 ID"
 
# 设置 网站域名和DNS记录域名
zone_name="Cloudflare里的网站域名"
record_name="DNS的记录,例如:baidu.com或者tieba.baidu.com"
```
Cloudflare API 密钥：[API 令牌 | Cloudflare](https://dash.cloudflare.com/profile/api-tokens)

Cloudflare 账户 ID：Cloudflare 站点设置里的概述页右下角

[![小云朵开启关闭权限.png](https://cdn-us.imgs.moe/2023/04/13/64381f585573d.png)](https://cdn-us.imgs.moe/2023/04/13/64381f585573d.png)

# 错误信息

如果运行脚本时遇到了 jq: command not found 错误，那么可能是因为您的系统上没有安装 jq 命令行工具。
```bash
在 Ubuntu / Debian 系统上：
sudo apt-get update
sudo apt-get install jq

在 CentOS / RHEL 系统上：
sudo yum install epel-release
sudo yum install jq

在 macOS 上（使用 Homebrew）：
brew install jq

在 Windows 上（使用 Scoop）：
scoop install jq

```
