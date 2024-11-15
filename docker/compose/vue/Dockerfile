# 构建阶段
FROM node:lts-alpine AS build-stage

# 使用 npm 直接安装 pnpm（替代 corepack 方案）
RUN npm install -g pnpm

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# 安装依赖（添加镜像源）
RUN pnpm config set registry https://registry.npmmirror.com/ && \
    pnpm install --frozen-lockfile

# 复制源代码
COPY . .

# 构建
RUN pnpm build

# 生产阶段
FROM node:lts-alpine AS production-stage

WORKDIR /app

# 使用 npm 镜像源安装 serve
RUN npm config set registry https://registry.npmmirror.com/ && \
    npm install -g serve

# 从构建阶段复制构建产物
COPY --from=build-stage /app/dist /app/dist

EXPOSE 3000

# 使用 serve 启动静态文件服务
CMD ["serve", "-s", "dist", "-l", "3000"]