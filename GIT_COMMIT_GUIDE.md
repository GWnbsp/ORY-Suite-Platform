# Git Commit 规范指南

## Commit Message 格式

<type>(<scope>): <subject>

<body>

<footer>

## Type 类型

| 类型     | 描述                                            | 示例                             |
| -------- | ----------------------------------------------- | -------------------------------- |
| feat     | 新功能                                          | feat(auth): 添加用户登录功能     |
| fix      | 修复 Bug                                        | fix(login): 修复登录验证失败问题 |
| docs     | 文档变更                                        | docs: 更新 README 文档           |
| style    | 代码格式(不影响代码运行的变动)                  | style: 调整代码缩进              |
| refactor | 重构(既不是新增功能，也不是修改 bug 的代码变动) | refactor(user): 重构用户管理模块 |
| perf     | 性能优化                                        | perf(query): 优化数据库查询性能  |
| test     | 增加测试                                        | test(auth): 添加用户认证测试用例 |
| chore    | 构建过程或辅助工具的变动                        | chore: 更新 CI 配置              |
| revert   | 回滚到上一个版本                                | revert: 撤销上一次提交           |

## Scope 范围

用于说明 commit 影响的范围，比如：

- auth
- login
- user
- config
- db
- api
- ui
- docs

## Subject 描述

- 以动词开头，使用第一人称现在时，比如 change，而不是 changed 或 changes
- 第一个字母小写
- 结尾不加句号（.）

## 示例

```bash
# 新功能
git commit -m "feat(auth): 添加 OAuth2 认证功能"

# 修复
git commit -m "fix(login): 修复登录表单验证问题"

# 文档
git commit -m "docs: 更新安装说明文档"

# 格式
git commit -m "style: 格式化代码风格"

# 重构
git commit -m "refactor(user): 重构用户认证逻辑"

# 性能
git commit -m "perf(query): 优化数据库查询性能"

# 测试
git commit -m "test(api): 添加用户API测试用例"

# 构建
git commit -m "chore: 更新 Docker 配置文件"
```

## 特殊提交说明

### 重大更改

当有破坏性更新时，提交信息应当在 Body 中以 `BREAKING CHANGE:` 开头：

```bash
feat: 允许提供配置对象

BREAKING CHANGE: `auth()` 方法现在接受一个配置对象而不是多个参数。

若要迁移代码，请将参数改写为配置对象。
```

### 回滚提交

当需要撤销之前的提交时：

```bash
revert: feat(auth): 添加 OAuth2 认证功能

This reverts commit hash123456
```

## 提交检查

建议使用以下工具来强制执行提交规范：

- commitlint
- husky
- commitizen

## Git 工作流建议

1. 创建功能分支

```bash
git checkout -b feature/login
```

2. 完成修改并提交

```bash
git add .
git commit -m "feat(login): 实现用户登录功能"
```

3. 合并到主分支

```bash
git checkout main
git merge feature/login
```

## 注意事项

- 每个提交应该是单一职责，不要在一个提交中混合多个功能
- 提交信息要清晰明了，方便他人理解
- 及时提交，避免积累大量改动
- 提交前先进行代码检查和测试

## 帮助链接

- [约定式提交](https://www.conventionalcommits.org/zh-hans/)
- [Angular 提交信息规范](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit)
- [语义化版本](https://semver.org/lang/zh-CN/)
