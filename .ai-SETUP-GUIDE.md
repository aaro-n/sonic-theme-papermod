# 🚀 Sonic PaperMod - .ai 系统快速启动指南

## ✅ 系统已初始化

恭喜！你的项目已经配置了完整的 AI 知识库系统。

## 📋 已创建的文件

### .ai 文件夹内容
```
.ai/
├── .INIT_REQUIRED              # 初始化标记文件
├── README.md          # 系统完整说明
├── MUST_READ_FIRST.md          # 强制规则（新对话必读！）
├── PROJECT_OVERVIEW.md         # 项目结构和信息
├── IMPORTANT_NOTES.md          # 关键代码位置和常用命令
└── ISSUES_AND_SOLUTIONS.md     # 问题库和解决方案
```

### scripts 文件夹内容
```
scripts/
├── install-git-hooks.sh        # Git 钩子安装脚本
└── check-ai-init.sh            # 初始化检查脚本
```

## 🎯 下一步要做什么

### 第一步：阅读强制规则（重要！）

新对话开始时，**必须**按顺序阅读这些文件：

```bash
# 建议的阅读顺序：
1. .ai/MUST_READ_FIRST.md       # 规则和快速参考
2. .ai/PROJECT_OVERVIEW.md      # 项目结构
3. .ai/IMPORTANT_NOTES.md       # 关键位置和常见问题
4. .ai/ISSUES_AND_SOLUTIONS.md  # 历史问题
```

### 第二步：安装 Git 钩子（推荐）

Git 钩子会在每次提交时提醒你更新 `.ai/` 文件。这是可选的，但推荐安装。

```bash
# 安装钩子
bash scripts/install-git-hooks.sh

# 验证安装
bash scripts/check-ai-init.sh
```

**钩子的功能**：
- ✅ 提醒你更新 `.ai/` 文件
- ✅ 防止删除关键的 `.ai/` 文件
- ✅ 确保知识库与代码同步

### 第三步：提交到 Git

现在你可以提交这个系统到 Git 仓库：

```bash
# 添加所有新文件
git add .ai/ scripts/

# 提交
git commit -m "docs: initialize AI knowledge base system

- Add .ai/ folder with comprehensive documentation
- Add scripts for git hooks and compliance checking
- MUST_READ_FIRST.md contains critical rules
- System helps maintain project knowledge and best practices"

# 推送到 GitHub
git push origin master
```

### 第四步：对团队成员的建议

如果项目有其他开发者，建议他们：

```bash
# 1. 拉取最新代码
git pull origin master

# 2. 可选：安装 Git 钩子
bash scripts/install-git-hooks.sh

# 3. 必读：阅读 .ai/MUST_READ_FIRST.md
cat .ai/MUST_READ_FIRST.md
```

## 📖 文件说明速查

| 文件 | 何时阅读 | 主要内容 |
|------|---------|
| **MUST_READ_FIRST.md** | 每次新对话开始 | 规则、快速参考、预防清单 |
| **PROJECT_OVERVIEW.md** | 第一次接触项目 | 项目结构、技术栈、文件说明 |
| **IMPORTANT_NOTES.md** | 修改代码前 | 关键位置、常用命令、常见错误 |
| **ISSUES_AND_SOLUTIONS.md** | 遇到问题时 | 历史问题、解决方案、经验教训 |
| **README.md** | 想了解系统本身 | .ai 系统的完整说明 |

## 🔄 日常工作流程

### 修改代码时

```
1. 修改代码文件
   ↓
2. 更新 .ai/ISSUES_AND_SOLUTIONS.md（记录解决了什么）
   ↓
3. 更新 .ai/IMPORTANT_NOTES.md（如果有新发现）
   ↓
4. git add .ai/ [修改的文件]
   ↓
5. git commit "描述 + .ai 文档更新"
   ↓
6. 完成！
```

### 如果忘记更新 .ai/

```bash
# Git 钩子会提醒你：
# ⚠️  WARNING: Code modified but .ai/ knowledge base not updated!

# 三种解决方案：

# 方案 1：更新 .ai/ 文件后重新提交（推荐）
git reset --soft HEAD~1
# 编辑 .ai/ 文件
git add .ai/
git commit -m "修改描述 + .ai 文档更新"

# 方案 2：创建新提交
# 编辑 .ai/ 文件
git add .ai/
git commit -m "docs: update AI knowledge base"

# 方案 3：跳过钩子（紧急情况）
git commit --no-verify
# ⚠️ 但之后必须手动更新 .ai/！
```

## 💡 关键概念

### 什么是 .ai 系统？

`.ai` 文件夹是项目的 **知识库系统**，用于：
- 📚 积累项目知识（问题、解决方案、经验）
- 🚀 加快新对话的理解（不用重新解释项目）
- 🔄 避免重复错误（记录已解决的问题）
- 👥 提高团队效率（知识共享）

### 为什么需要这个系统？

1. **节省时间** - AI 不用每次都重新理解项目
2. **避免重复** - 已解决的问题不会重复踩坑
3. **知识积累** - 项目知识随着时间不断完善
4. **最佳实践** - 记录关键代码位置和操作方法

### 哪些项目应该使用？

- ✅ 需要长期维护的项目
- ✅ 有多个开发者的项目
- ✅ 涉及复杂逻辑或陌生技术的项目
- ✅ 需要与 AI 合作的项目

## 🎯 常见问题

### Q1: 必须安装 Git 钩子吗？

**A**: 不一定。钩子是可选的，但强烈推荐。
- 不安装：仍然可以使用 .ai 系统，但需要手动记住更新
- 安装：钩子会自动提醒，确保知识库不会过期

### Q2: 如果有人没安装钩子怎么办？

**A**: 完全没问题。
- 不安装钩子也能正常工作
- 只是失去了自动提醒功能
- 仍然需要手动更新 .ai/ 文件

### Q3: 这些文件会上传到 GitHub 吗？

**A**: 是的，完全可以上传。
- `.ai/` 文件是普通文档，没有问题
- `scripts/` 中的脚本也可以上传
- `.git/hooks/` 目录不会被上传（这是 git 特性）
- Git 钩子是本地的，不会影响其他开发者

### Q4: 如何卸载 Git 钩子？

**A**: 简单：
```bash
# 删除钩子文件
rm .git/hooks/pre-commit

# 或者
bash scripts/install-git-hooks.sh  # 再运行一次选择不安装
```

### Q5: 在 Windows 上能用吗？

**A**: 取决于你的 Git 配置。
- Git Bash：✅ 完全支持
- WSL2：✅ 完全支持
- Windows PowerShell 或 cmd：可能需要调整

## 📝 修改 .ai 文件时的规范

### 推荐的格式

在 `ISSUES_AND_SOLUTIONS.md` 中记录问题时，使用这个格式：

```markdown
## 问题名称

**发现时间**: 2026-02-20
**状态**: ✅ 已解决

### 问题描述
[描述现象]

### 根本原因分析
[分析为什么]

### 解决方案
[详细步骤]

### 关键修改
- [文件路径] - [说明]

### 失败尝试
- ❌ [不行的方法1]
- ❌ [不行的方法2]

### 经验教训
[学到了什么]
```

### 使用标记

```
✅ - 成功的解决方案或已完成的项目
❌ - 失败的尝试或不推荐的方法
⚠️  - 需要注意的地方或潜在问题
📋 - 信息记录
```

## 🚀 快速参考命令

```bash
# 检查 .ai 系统是否完整
bash scripts/check-ai-init.sh

# 安装 Git 钩子
bash scripts/install-git-hooks.sh

# 卸载 Git 钩子
rm .git/hooks/pre-commit

# 查看 Git 状态
git status

# 查看 .ai 文件的改动
git diff .ai/

# 提交时跳过钩子（紧急）
git commit --no-verify -m "紧急修复"
```

## 📚 完整文档导航

1. **本文件** (这个文件)
   - 快速启动指南
   - 常见问题

2. **[.ai/MUST_READ_FIRST.md](.ai/MUST_READ_FIRST.md)** ⭐ 必读
   - 强制规则
   - 快速参考表
   - 预防清单
3. **[.ai/PROJECT_OVERVIEW.md](.ai/PROJECT_OVERVIEW.md)**
   - 项目描述
   - 目录结构
   - 文件说明
   - 技术栈

4. **[.ai/IMPORTANT_NOTES.md](.ai/IMPORTANT_NOTES.md)**
   - 关键代码位置
   - 常用命令
   - 修改前检查清单
   - 常见错误和解决

5. **[.ai/ISSUES_AND_SOLUTIONS.md](.ai/ISSUES_AND_SOLUTIONS.md)**
   - 问题库
   - 解决方案
   - 经验教训

6. **[.ai/README.md](.ai/README.md)**
   - .ai 系统完整说明
   - 文档维护规范

## ✅ 系统启动检查清单

在开始使用之前，确认：

- [ ] 已阅读 `MUST_READ_FIRST.md`
- [ ] 了解了 5 个核心文件的作用
- [ ] 决定是否安装 Git 钩子
- [ ] 理解了日常工作流程
- [ ] 可以找到关键的文件位置

## 🎉 祝贺！

你的项目现在有了一套完整的 AI 知识库系统。

**下一步**：
1. 阅读 [.ai/MUST_READ_FIRST.md](.ai/MUST_READ_FIRST.md)
2. 决定是否安装 Git 钩子
3. 提交这个系统到 Git

**推荐**：在项目的 README.md 中添加一个链接，告诉其他开发者关于这个系统。

---

**有问题？** 查看对应的 .ai 文件：
- 规则问题 → `.ai/MUST_READ_FIRST.md`
- 项目信息 → `.ai/PROJECT_OVERVIEW.md`
- 操作问题 → `.ai/IMPORTANT_NOTES.md`
- 历史问题 → `.ai/ISSUES_AND_SOLUTIONS.md`

**希望这个系统对你有帮助！** 💪
