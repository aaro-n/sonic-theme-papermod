# 🔧 关键信息与常见问题 - Sonic PaperMod

## 📌 自动化系统说明

从 2026-02-20 开始，这个项目使用**自动初始化系统**：

- ✅ AI 助手会自动检测 `.ai/.WORKSPACE_CONFIG`
- ✅ 自动执行 `.ai/WORKFLOW.md` 中的初始化步骤
- ✅ 无需用户每次都提醒 AI
- ✅ AI 自然地遵守项目约定

相关文件：
- `.ai/WORKFLOW.md` - 完整的自动化工作流
- `.ai/.WORKSPACE_CONFIG` - 工作空间配置（AI 检测）
- `.project.json` - 项目元数据配置

## 📍 关键代码位置速查

### 首页和主列表页面
| 功能 | 文件路径 | 说明 |
|------|---------|------|
| 首页布局 | `index.tmpl` | 显示最新文章列表，调用 post-entry.tmpl |
| 文章项模板 | `module/post-entry.tmpl` | 单个文章摘要项，复用在多个列表页 |
| 分类列表 | `categories.tmpl` | 显示所有分类 |
| 分类页面 | `category.tmpl` | 单个分类下的所有文章 |
| 标签列表 | `tags.tmpl` | 显示所有标签 |
| 标签页面 | `tag.tmpl` | 单个标签下的所有文章 |
| 归档页面 | `archives.tmpl` | 按时间组织的所有文章 |

### 页面结构相关
| 功能 | 文件路径 | 说明 |
|------|-------|------|
| 页面头部 | `module/header.tmpl` | 导航栏、logo、深浅色切换按钮 |
| 页面脚部 | `module/footer.tmpl` | 版权信息、链接、站点信息 |
| HTML 头部 | `module/head.tmpl` | meta 标签、样式表、脚本加载 |
| 文章详情 | `post.tmpl` | 单篇文章内容、评论、相关文章等 |

### 样式和配置
| 功能 | 文件路径 | 说明 |
|------|---------|------|
| 主样式表 | `assets/main.css` | 所有样式规则（包含响应式、深浅色模式） |
| 主题配置 | `theme.yaml` | Sonic 平台的主题元数据（包括 id、author、website、repo 等） |
| 设置文件 | `settings.yaml` | 主题的默认设置值 |

### ⚠️ theme.yaml 关键字段说明

修改 `theme.yaml` 时注意以下字段（直接影响 SONIC 中显示的信息）：

| 字段 | 说明 | 示例 | 修改场景 |
|------|------|------|---------|
| `id` | 主题唯一标识 | `sonic_theme_paper_mod` | 不建议修改 |
| `author.name` | 作者名称 | `jakezhu9` | Fork 时改为自己名字 |
| `author.website` | 作者网站 | `https://ggg.life` | 非必要不改 |
| `website` | 主题官网/仓库 | `https://github.com/aaro-n/sonic-theme-papermod` | **Fork 后必改** |
| `repo` | Git 仓库地址 | `https://github.com/aaro-n/sonic-theme-papermod` | **Fork 后必改** |
| `version` | 版本号 | `1.0.0` | 发布新版本时更新 |

**重要**: Fork 后务必更新 `website` 和 `repo` 字段为自己的仓库地址，否则 SONIC 会显示原仓库的信息。

## ⚙️ 常用命令参考

### Git 相关命令

```bash
# 查看项目状态
git status

# 查看所有改动
git diff

# 查看 .ai/ 文件夹的改动
git diff .ai/

# 添加特定文件
git add [文件路径]

# 添加所有 .ai/ 文件
git add .ai/

# 提交更改
git commit -m "[类型]: [描述]"
# 例如：
git commit -m "feat: 改进首页布局 + .ai 文档更新"

# 查看提交历史
git log --oneline -10

# 查看特定文件的历史
git log --oneline -- [文件路径]

# 查看前一个提交的内容
git show HEAD

# 回退到前一个提交（仅本地）
git reset --soft HEAD~1
```

### 项目检查命令

```bash
# 验证 .ai 系统完整性
bash scripts/check-ai-init.sh

# 查看项目结构
tree -L 2 -I '.git'

# 查看文件列表
ls -la

# 查看所有模板文件
find . -name "*.tmpl" -type f

# 查看所有样式文件
find . -name "*.css" -type f

# 统计行数
wc -l *.tmpl module/*.tmpl assets/main.css
```

### Git 钩子相关命令

```bash
# 安装 pre-commit 钩子
bash scripts/install-git-hooks.sh

# 卸载钩子
rm .git/hooks/pre-commit

# 跳过钩子进行紧急提交
git commit --no-verify -m "紧急修复"

# 手动运行钩子测试
bash .git/hooks/pre-commit
```

## 📋 修改前检查清单

**修改任何文件前，请检查以下项目**：

### 修改 HTML/模板文件前
- [ ] 我理解该文件的用途和在页面中的位置
- [ ] 我知道该文件在哪些页面上被使用
- [ ] 我有原始代码的备份（记在笔记中）
- [ ] 我计划在多个设备上测试响应式效果（手机、平板、桌面）
- [ ] 我了解修改对相关文件的影响

### 修改 CSS 样式前
- [ ] 我知道要修改的样式规则具体在哪一行
- [ ] 我理解该规则对页面的影响
- [ ] 我有原始代码的备份
- [ ] 我会在浅色和深色两种模式下测试
- [ ] 我检查了是否有相同的样式规则在其他地方

### 修改配置文件前
- [ ] 我理解每个配置选项的含义
- [ ] 我查阅了 Sonic 官方文档中的相关说明
- [ ] 我知道修改会影响哪些功能
- [ ] 我有原始值的备份
- [ ] 我测试了修改后的效果

### 任何修改后
- [ ] ✅ 我更新了 `.ai/ISSUES_AND_SOLUTIONS.md`
- [ ] ✅ 我执行了 `git add .ai/`
- [ ] ✅ 我一起提交了代码和文档

## ⚠️ 常见错误和解决方案

### 错误 1：修改模板后页面显示不正常

**症状**：
- 文章列表不显示
- 页面布局错乱
- 某些内容消失

**常见原因**：
1. HTML 标签不匹配（开标签和闭标签不对应）
2. Hugo 模板语法错误（例如 `.Range` 缺少 `end`）
3. 模板变量名称错误（Hugo 变量区分大小写）
4. 缩进问题导致代码逻辑错误

**解决步骤**：
```bash
# 1. 检查你修改的文件
git diff [文件路径]

# 2. 恢复原始内容
git checkout [文件路径]

# 3. 仔细检查修改，逐步应用改动
# 4. 每修改一处后立即测试
# 5. 使用编辑器检查语法高亮是否正常
```

### 错误 2：样式不生效或样式混乱

**症状**：
- 修改 CSS 后没有生效
- 新增的样式没有显示
- 颜色、大小等显示错误

**常见原因**：
1. CSS 选择器不够具体（被其他规则覆盖）
2. CSS 优先级问题
3. 浏览器缓存（内存缓存或硬盘缓存）
4. 深浅色模式的 CSS 变量冲突

**解决步骤**：
```bash
# 1. 清除浏览器缓存
# - 方法1：按 Ctrl+Shift+Del 打开缓存清除面板
# - 方法2：关闭浏览器重新打开
# - 方法3：在浏览器开发者工具中禁用缓存

# 2. 检查 CSS 选择器的特异性
# - 使用浏览器 F12 开发者工具检查应用的样式
# - 查看是否有其他规则覆盖了你的修改

# 3. 验证 CSS 语法
# - 打开 assets/main.css
# - 查找你修改的部分
# - 检查是否有语法错误（缺少分号、括号不匹配等）

# 4. 如果是深浅色模式问题
# - 检查 CSS 变量是否被正确定义
# - 验证 @media (prefers-color-scheme: dark) 中的规则
# - 测试 body.dark-mode 中的规则是否生效
```

### 错误 3：响应式设计在某些设备上不工作

**症状**：
- 手机上显示很丑
- 平板上排版错乱
- 某些元素在小屏幕上重叠

**常见原因**：
1. 媒体查询断点设置不当
2. 没有考虑所有屏幕宽度
3. 固定宽度的元素没有响应式处理
4. Viewport meta 标签缺失或配置错误

**解决步骤**：
```bash
# 1. 在浏览器开发者工具中测试
# - F12 打开开发者工具
# - Ctrl+Shift+M 进入设备模拟模式
# - 测试不同的屏幕宽度

# 2. 检查媒体查询规则
# 打开 assets/main.css，查找：
# @media (max-width: 500px) { ... }
# @media (max-width: 1000px) { ... }

# 3. 确保 viewport 标签正确
# 在 module/head.tmpl 中应该有：
# <meta name="viewport" content="width=device-width, initial-scale=1">

# 4. 测试常见断点
# - 手机: 375px (iPhone SE), 414px (iPhone 12)
# - 平板: 768px (iPad), 1024px (iPad Pro)
# - 桌面: 1280px, 1920px
```

### 错误 4：深浅色模式切换不工作

**症状**：
- 点击深浅色切换按钮没有反应
- 颜色不随用户选择改变
- 某些元素颜色不对

**常见原因**：
1. JavaScript 代码丢失或错误
2. CSS 变量未正确定义
3. HTML 中缺少必要的 class 或 id
4. 浏览器不支持 CSS 变量（极少见）

**解决步骤**：
```bash
# 1. 检查 HTML 中的切换按钮
# 在 module/header.tmpl 中查找深浅色切换按钮

# 2. 验证 JavaScript 代码
# 检查是否有 toggleDarkMode() 或类似函数

# 3. 检查 CSS 变量定义
# 在 assets/main.css 中搜索：
# :root { --primary-color: ...; }
# @media (prefers-color-scheme: dark) { ... }
# body.dark-mode { ... }

# 4. 在浏览器控制台测试
# F12 → Console 标签，运行：
# document.body.classList.toggle('dark-mode')
# 如果页面颜色改变，说明 CSS 没问题，可能是 JavaScript 问题
```

### 错误 5：提交代码后发现忘记更新 .ai/

**症状**：
- 已经 `git commit` 了代码
- 但忘记更新 `.ai/` 文件
- 现在想补救

**解决步骤**：
```bash
# 方法 1：修改上一个提交（如果还没推送到远程）
# 1. 更新 .ai/ 文件
# 编辑 .ai/ISSUES_AND_SOLUTIONS.md 等

# 2. 添加到暂存区
git add .ai/

# 3. 修改上一个提交
git commit --amend --no-edit

# 这会将 .ai/ 更改添加到上一个提交中

# 方法 2：创建新的提交（如果已经推送到远程）
# 1. 更新 .ai/ 文件
# 编辑 .ai/ISSUES_AND_SOLUTIONS.md 等

# 2. 添加并提交
git add .ai/
git commit -m "docs: update AI knowledge base for previous changes"

# 3. 推送
git push origin master
```

## 🔒 安全操作指南

### 修改前备份
始终保留原始代码的记录：

```bash
# 方法 1：使用 git 查看原始内容
git show HEAD:[文件路径]

# 方法 2：创建备份分支
git branch backup-2026-02-20
git checkout backup-2026-02-20
git checkout master  # 回到 master 分支进行修改
```

### 测试修改

修改后务必测试：
```bash
# 1. 检查语法错误
grep -n "{{" [文件路径]  # 检查模板语法

# 2. 验证 HTML 结构
# 在浏览器中查看页面源代码 (Ctrl+U)

# 3. 测试所有受影响的页面
# - 首页
# - 文章详情页
# - 分类/标签列表页
# - 不同的设备和分辨率
```

### 出错时快速恢复

如果修改出错，快速恢复原始状态：

```bash
# 恢复单个文件
git checkout [文件路径]

# 恢复整个文件夹
git checkout .

# 查看哪些文件已被修改
git status

# 丢弃所有未暂存的改动
git reset --hard
```

## 💡 性能优化提示

### CSS 优化
- ❌ 避免使用 `@import` 导入外部样式表
- ✅ 将所有样式合并到 `main.css`
- ✅ 使用 CSS 变量减少重复代码
- ✅ 使用简洁的选择器（避免过度嵌套）

### 模板优化
- ❌ 避免在模板中做复杂的计算
- ✅ 使用 Hugo 的内置函数和变量
- ✅ 合理使用 partial 复用代码
- ✅ 避免在模板中进行大量的数据查询

### 响应式设计
- ✅ 使用 mobile-first 方式（先做手机版，再添加平板和桌面样式）
- ✅ 使用相对单位（em、rem、%）而不是固定像素
- ✅ 测试所有常见的断点
- ✅ 使用 Flexbox 和 Grid 进行布局

## 📚 文件修改快速参考

### 何时修改哪个文件

| 需求 | 修改文件 | 备注 |
|------|---------|------|
| 改变首页布局 | `index.tmpl` | 需要检查 post-entry.tmpl 是否兼容 |
| 改变文章卡片样式 | `module/post-entry.tmpl` + `assets/main.css` | 影响所有列表页 |
| 改变页面标题/导航 | `module/header.tmpl` + `assets/main.css` | 在所有页面都显示 |
| 改变页脚 | `module/footer.tmpl` + `assets/main.css` | 在所有页面都显示 |
| 添加新的样式规则 | `assets/main.css` | 记得添加对应的媒体查询 |
| 改变主题颜色 | `assets/main.css` | 在深浅色模式中都修改 |
| 添加新的主题选项 | `theme.yaml` + `settings.yaml` | 两个文件都需要更新 |

## 🚀 快速参考命令表

```bash
# 快速检查项目状态
git status

# 查看你的改动
git diff

# 查看 .ai/ 文件夹的改动
git diff .ai/

# 添加所有改动
git add .

# 添加特定文件
git add [文件]

# 提交更改
git commit -m "说明"

# 推送到远程
git push origin master

# 回退最后一个提交
git reset --soft HEAD~1

# 查看提交历史
git log --oneline -5

# 在修改前检查 .ai 系统
bash scripts/check-ai-init.sh

# 安装 git 钩子（推荐）
bash scripts/install-git-hooks.sh
```

---

**下一步**：查看 [ISSUES_AND_SOLUTIONS.md](ISSUES_AND_SOLUTIONS.md) 了解项目历史问题和解决方案。
