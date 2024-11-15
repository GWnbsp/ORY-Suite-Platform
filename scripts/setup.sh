# 确保脚本在错误时退出
set -e

# 创建必要的目录
mkdir -p docker/postgres/init
mkdir -p configs/{kratos,hydra,keto,oathkeeper}

# 给初始化脚本添加执行权限
chmod +x docker/postgres/init/01-init-db.sh

# 启动开发环境
cd docker/compose
docker compose --env-file ../config/development.env up -d

# 等待服务健康检查
echo "等待服务启动..."
sleep 10

# 验证服务健康状态
curl -s http://localhost:4433/health/alive || echo "Kratos 未就绪"
curl -s http://localhost:4444/health/alive || echo "Hydra 未就绪"
curl -s http://localhost:4466/health/alive || echo "Keto 未就绪"
curl -s http://localhost:4456/health/alive || echo "Oathkeeper 未就绪"
