#!/bin/bash

# 服务器连接信息
USER="root"
HOST="47.83.18.133"
TARGET="/www/wwwroot/47.83.18.133_18040/justin3go.com/docs/.vitepress/dist"

# 1. 进入构建目录并打包
cd docs/.vitepress/dist
tar -czf /tmp/website.tar.gz .

# 2. 传输压缩包（使用 sshpass）
sshpass -e scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /tmp/website.tar.gz $USER@$HOST:/tmp/

# 3. 在服务器上解压
sshpass -e ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $USER@$HOST "mkdir -p $TARGET && tar -xzf /tmp/website.tar.gz -C $TARGET && rm /tmp/website.tar.gz"
