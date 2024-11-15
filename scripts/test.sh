# 确保脚本在错误时退出
set -e

# 停止之前的环境（如果有）
cd docker/compose
docker compose --env-file ../config/test.env down -v

# 启动测试环境
docker compose --env-file ../config/test.env up -d

# 等待服务启动
echo "等待服务启动..."
sleep 10

# 运行测试
echo "开始运行测试..."

# 验证数据库初始化
docker exec ory-test_postgres psql -U postgres -c "\l" | grep -q "ory-kratos" || exit 1
docker exec ory-test_postgres psql -U postgres -c "\l" | grep -q "ory-hydra" || exit 1
docker exec ory-test_postgres psql -U postgres -c "\l" | grep -q "ory-keto" || exit 1

# 验证服务健康状态
curl -s http://localhost:4433/health/alive || exit 1
curl -s http://localhost:4444/health/alive || exit 1
curl -s http://localhost:4466/health/alive || exit 1
curl -s http://localhost:4456/health/alive || exit 1

echo "测试完成"

# 清理测试环境
docker compose --env-file ../config/test.env down -v
