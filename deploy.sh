#!/bin/bash

USER="root"
HOST="47.83.18.133"
TARGET="/www/wwwroot/47.83.18.133_18040/justin3go.com/docs/.vitepress/dist"

# 1. 确认构建目录存在并列出内容（调试）
cd docs/.vitepress/dist || exit 1
echo "=== 当前目录 ==="
pwd
ls -la
echo "=== 文件数量 ==="
find . -type f | wc -l

# 2. 打包
echo "=== 开始打包 ==="
tar -czf /tmp/website.tar.gz .
ls -lh /tmp/website.tar.gz

# 3. 传输
echo "=== 传输压缩包 ==="
sshpass -e scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /tmp/website.tar.gz $USER@$HOST:/tmp/

# 4. 解压
echo "=== 服务器解压 ==="
sshpass -e ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $USER@$HOST "
  mkdir -p $TARGET &&
  tar -xzvf /tmp/website.tar.gz -C $TARGET 2>&1 &&
  echo '解压成功'
"
