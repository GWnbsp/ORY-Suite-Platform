# ORY-Suite-Platform

<p align="center">
  <strong>基于 ORY 生态系统的身份认证与授权入门模板</strong>
</p>

## 介绍

这是一个基于 ORY 生态系统的入门级模板项目。通过本项目，您可以快速了解和搭建基于 ORY 的身份认证与授权系统。集成了 Hydra、Kratos、Keto 和 Oathkeeper 核心组件，帮助开发者轻松开始 ORY 相关开发。

## 功能特性

- 🔐 完整的身份认证流程 (Kratos)
- 🔑 OAuth2/OpenID Connect 支持 (Hydra)
- 🛡️ 权限控制系统 (Keto)
- 🚪 API 网关和认证代理 (Oathkeeper)
- 📦 开箱即用的 Docker 环境
- 📝 详细的示例代码

## 项目结构

```
├── docker/ # Docker 相关配置
│ ├── compose/ # Docker Compose 文件
│ └── config/ # 容器配置文件
│
├── configs/ # 组件配置目录
│ ├── hydra/ # Hydra 配置
│ ├── kratos/ # Kratos 配置
│ ├── keto/ # Keto 配置
│ └── oathkeeper/ # Oathkeeper 配置
│
├── scripts/ # 工具脚本
│ ├── setup.sh # 环境设置脚本
│ └── test.sh # 测试脚本
│
├── examples/ # 示例代码
│ ├── login/ # 登录示例
│ ├── oauth2/ # OAuth2 示例
│ └── permissions/ # 权限控制示例
│
└── docs/ # 文档目录
├── setup.md # 安装指南
├── components.md # 组件说明
└── examples.md # 示例教程

```

## 快速开始

### 前置条件

- Docker 20.10+
- Docker Compose 2.0+
- Git

### 基础安装

```bash
# 克隆项目
git clone https://github.com/GWnbsp/ORY-Suite-Platform.git

# 进入项目目录
cd ORY-Suite-Platform

# 启动服务
docker-compose up -d
```

### 验证安装

```bash
# 检查服务状态
docker-compose ps

```

## 组件说明

### ORY Kratos

身份管理系统，负责：

- 用户注册
- 用户登录
- 账户管理
- 个人资料

### ORY Hydra

OAuth2 服务器，提供：

- OAuth2 授权
- OpenID Connect
- JWT 管理

### ORY Keto

权限管理系统，实现：

- 访问控制
- 权限检查
- 角色管理

### ORY Oathkeeper

API 网关，处理：

- 请求转发
- 认证代理
- 访问控制

## 基础示例

### 1. 用户注册登录

```bash
# 启动示例
cd examples/login
docker-compose up -d
```

### 2. OAuth2 授权

```bash
# 启动 OAuth2 示例
cd examples/oauth2
./run.sh
```

### 3. 权限控制

```bash
# 运行权限示例
cd examples/permissions
./demo.sh
```

## 配置说明

### 环境变量

主要的环境变量配置：

```env
# Kratos
KRATOS_ADMIN_URL=http://kratos:4434
KRATOS_PUBLIC_URL=http://kratos:4433

# Hydra
HYDRA_ADMIN_URL=http://hydra:4445
HYDRA_PUBLIC_URL=http://hydra:4444

# Keto
KETO_READ_URL=http://keto:4466
KETO_WRITE_URL=http://keto:4467

# Oathkeeper
OATHKEEPER_API_URL=http://oathkeeper:4456
```

## 开发指南

### 本地开发

1. 修改配置文件
2. 重启相关服务
3. 查看日志进行调试

### 调试技巧

- 使用 `docker-compose logs` 查看服务日志
- 检查各服务的健康检查端点
- 使用配套的管理 UI 进行调试

## 常见问题

### Q: 服务无法启动？

A: 检查端口占用和配置文件是否正确

### Q: 认证失败？

A: 确认各服务的 URL 配置是否正确

## 路线图

- [ ] 添加更多示例代码
- [ ] 完善文档说明
- [ ] 添加监控配置
- [ ] 优化开发体验

## 贡献指南

1. Fork 本仓库
2. 创建特性分支
3. 提交改动
4. 发起 Pull Request

## 相关资源

- [ORY 官方文档](https://www.ory.sh/docs/)
- [ORY GitHub](https://github.com/ory)
- [ORY 社区](https://community.ory.sh/)

## 许可证

本项目采用 Apache License 2.0 许可证 - 详情请参阅 [LICENSE](LICENSE) 文件

## 联系方式

- Issues: [GitHub Issues](https://github.com/GWnbsp/ORY-Suite-Platform/issues)
- 邮箱: 待补充
