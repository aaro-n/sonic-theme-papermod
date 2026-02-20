# 📋 项目概览 - Sonic PaperMod 主题

## 📌 基本信息

| 项目属性 | 值 |
|---------|-----|
| **项目名称** | Sonic PaperMod |
| **项目类型** | Hugo 静态网站主题 |
| **开发语言** | Hugo Templates（HTML/CSS） |
| **主要技术** | HTML, CSS, Hugo Templating |
| **License** | MIT License |
| **源项目** | [hugo-papermod](https://github.com/adityatelange/hugo-PaperMod) |
| **目标平台** | [Sonic 博客平台](https://github.com/go-sonic/sonic) |
| **版本管理** | Git |
| **仓库地址** | https://github.com/jakezhu9/sonic-theme-papermod |

## 🎯 项目描述

**Sonic PaperMod** 是为 Sonic 博客平台定制的 Hugo 主题，基于流行的 PaperMod 主题。

### 核心特性
- ☄️ **快速** - 优化的加载性能
- ☁️ **流畅** - 平滑的用户交互体验
- 🌙 **深浅色模式** - 支持浅色/深色主题切换
- 📱 **响应式设计** - 完美适配各种设备尺寸（手机、平板、桌面）

## 📂 项目目录结构

```
sonic-theme-papermod/
├── .ai/              # AI 知识库（本系统）
│   ├── README.md
│   ├── MUST_READ_FIRST.md
│   ├── PROJECT_OVERVIEW.md      # 本文件
│   ├── IMPORTANT_NOTES.md
│   ├── ISSUES_AND_SOLUTIONS.md
│   └── .INIT_REQUIRED
│
├── .git/                       # Git 版本控制
│
├── scripts/               # 工具脚本
│   ├── install-git-hooks.sh      # Git 钩子安装脚本
│   └── check-ai-init.sh          # AI 初始化检查脚本
│
├── module/                 # Hugo 模块（主题组件）
│   ├── footer.tmpl               # 页脚模板
│   ├── head.tmpl                 # 页面头部模板
│   ├── header.tmpl         # 网站头部/导航模板
│   └── post-entry.tmpl           # 文章条目模板
│
├── assets/          # 资源文件
│   └── main.css                  # 主样式表（包含深浅色模式）
│
├── [root templates]/             # 根级 Hugo 模板
│   ├── archives.tmpl             # 归档页面模板
│   ├── categories.tmpl      # 分类列表模板
│   ├── category.tmpl       # 单个分类模板
│   ├── index.tmpl                # 首页模板
│   ├── post.tmpl         # 文章详情页模板
│   ├── sheet.tmpl              # 静态页面模板
│   ├── tag.tmpl          # 单个标签模板
│   └── tags.tmpl                 # 标签列表模板
│
├── theme.yaml         # 主题配置文件（Sonic 特定）
├── settings.yaml              # 设置配置文件
├── screenshot.png            # 主题截图
├── README.md               # 项目 README（用户指南）
├── LICENSE                        # MIT 许可证
└── .gitignore         # Git 忽略文件配置

```

## 🔧 关键文件说明

### 配置文件

#### `theme.yaml`
- **用途**：Sonic 平台的主题配置文件
- **内容**：主题元数据、选项定义、功能配置
- **修改频率**：中等（添加新主题选项时修改）

#### `settings.yaml`
- **用途**：主题的默认设置值
- **内容**：各种主题选项的默认值
- **修改频率**：中等（调整默认配置时修改）

### 模板文件

#### 根级模板
- **`index.tmpl`** - 首页布局，展示最新文章列表
- **`post.tmpl`** - 单篇文章详情页，包含文章内容、元信息、相关文章等
- **`archives.tmpl`** - 文章归档页面，按时间组织所有文章
- **`categories.tmpl`** - 分类列表页面
- **`category.tmpl`** - 单个分类页面，展示该分类的所有文章
- **`tags.tmpl`** - 标签列表页面
- **`tag.tmpl`** - 单个标签页面，展示该标签的所有文章
- **`sheet.tmpl`** - 静态页面（关于页面、联系页面等）

#### 模块化模板（module/）
Hugo 的模块（partial）允许代码复用：

- **`module/head.tmpl`** - 页面 <head> 部分
  - 包含元标签、样式表引用、脚本加载
  - 涉及 SEO、性能优化

- **`module/header.tmpl`** - 网站头部/导航栏
  - 站点标题、导航菜单
  - 深浅色模式切换按钮

- **`module/footer.tmpl`** - 页脚
  - 版权信息、链接
  - 其他元信息

- **`module/post-entry.tmpl`** - 文章列表项模板
  - 文章标题、摘要、日期、分类、标签
  - 在首页和列表页复用

### 样式文件

#### `assets/main.css`
- **用途**：主题的所有样式规则
- **特性**：
  - 响应式设计（媒体查询）
  - 深浅色模式（CSS 变量）
  - 平滑动画和过渡
  - 排版优化

### 脚本文件

#### `scripts/install-git-hooks.sh`
- **用途**：自动安装 Git 钩子
- **功能**：创建 pre-commit 钩子，在提交时检查 .ai/ 是否更新

#### `scripts/check-ai-init.sh`
- **用途**：检查 .ai 系统是否完整初始化
- **功能**：验证所有必需的 .ai/ 文件都存在且非空

## 🔄 工作流程和依赖

### 安装和部署流程

```
1. 开发者 clone 项目
2. （可选）运行 bash scripts/install-git-hooks.sh
3. 在 Sonic 后台管理界面：
   - Admin → Appearance → Theme
   - 选择"Install Theme" → "Remote Pull"
   - 输入 GitHub 仓库地址：https://github.com/jakezhu9/sonic-theme-papermod
   - 点击 Download 下载主题
4. 激活主题
5. 访问博客检查效果
```

### 模板引用关系

```
首页请求
├─ index.tmpl
│  ├─ module/header.tmpl
│  ├─ module/post-entry.tmpl (循环显示每篇文章)
│  └─ module/footer.tmpl

文章详情页请求
├─ post.tmpl
│  ├─ module/header.tmpl
│  ├─ [文章内容]
│  └─ module/footer.tmpl

分类/标签/归档页
├─ category.tmpl / tag.tmpl / archives.tmpl
│  ├─ module/header.tmpl
│  ├─ module/post-entry.tmpl (循环显示过滤后的文章)
│  └─ module/footer.tmpl
```

### 样式应用流程

```
主题激活
  ↓
Hugo 编译 main.css
  ↓
CSS 变量初始化（深浅色模式）
  ↓
页面加载时应用样式
  ↓
用户交互时切换颜色模式（JS）
```

## 📊 技术栈概览

| 技术 | 用途 | 版本/说明 |
|------|----------|
| **Hugo** | 静态网站生成器 | 0.87+ |
| **HTML** | 页面标记 | HTML5 |
| **CSS** | 样式设计 | CSS3（包含变量、媒体查询） |
| **Git** | 版本控制 | - |
| **Bash** | 脚本编程 | 用于 Git 钩子 |

## 🎨 主题色彩系统

### 响应式设计

主题使用 CSS 媒体查询实现响应式：

```
设备宽度范围     | 适配方案
500px 以下       | 手机竖屏
500px - 1000px   | 平板或大手机
1000px 以上      | 桌面
```

### 深浅色模式

使用 CSS 变量实现主题切换：

```css
/* 浅色模式变量 */
--bg-color: #ffffff;
--text-color: #000000;

/* 深色模式变量 */
@media (prefers-color-scheme: dark) {
  --bg-color: #1a1a1a;
  --text-color: #ffffff;
}

/* 用户手动切换也可以改变这些变量 */
body.dark-mode {
  --bg-color: #1a1a1a;
  --text-color: #ffffff;
}
```

## 🚀 开发和构建

### 本地开发（如果有 Hugo）

```bash
# 安装主题到 Hugo 项目
git clone https://github.com/jakezhu9/sonic-theme-papermod themes/papermod

# 在 Hugo config 中引用
# config.toml: theme = "papermod"

# 构建网站
hugo

# 查看效果
hugo server  # 访问 http://localhost:1313
```

### 在 Sonic 上部署

```bash
# 复制整个项目内容到 Sonic 主题目录
cp -r sonic-theme-papermod /path/to/sonic/themes/

# 或通过 Web UI：
# Admin → Appearance → Theme → Install Theme → Remote Pull
```

## 📈 项目成熟度

| 功能 | 状态 | 说明 |
|------|------|------|
| 基础布局 | ✅ 完成 | 首页、文章页、列表页 |
| 响应式设计 | ✅ 完成 | 支持手机、平板、桌面 |
| 深浅色模式 | ✅ 完成 | 自动检测和手动切换 |
| 搜索功能 | ❌ 待做 | TODO |
| 评论系统 | ❌ 待做 | TODO |
| 代码高亮 | ❌ 待做 | TODO |
| 高级自定义选项 | ❌ 待做 | TODO |

## 🔗 重要链接

- **原项目**：[hugo-PaperMod](https://github.com/adityatelange/hugo-PaperMod)
- **Sonic 平台**：[go-sonic/sonic](https://github.com/go-sonic/sonic)
- **Hugo 官方文档**：[https://gohugo.io/documentation/](https://gohugo.io/documentation/)
- **CSS 媒体查询**：[MDN - Media Queries](https://developer.mozilla.org/docs/Web/CSS/Media_Queries)

## 💡 关键设计原则

1. **简洁性** - 遵循 PaperMod 的极简设计哲学
2. **性能** - 优化关键渲染路径，减少不必要的资源
3. **可访问性** - 支持屏幕阅读器、键盘导航
4. **响应式** - 一套代码适配所有设备
5. **用户选择** - 允许用户选择深浅色模式

## 📝 常用术语解释

| 术语 | 解释 |
|------|------|
| **Hugo** | 静态网站生成器，用 Go 语言编写 |
| **Theme/主题** | Hugo 的预定义样式和模板集合 |
| **Template/模板** | 用于生成 HTML 的 Hugo 模板文件（.tmpl） |
| **Partial/模块** | Hugo 的模板文件片段，可在多个模板中复用 |
| **Asset/资源** | CSS、JS、图片等静态资源 |
| **PaperMod** | 一个流行的极简 Hugo 主题 |
| **Sonic** | 用 Go 开发的现代博客平台 |

---

**下一步**：阅读 [IMPORTANT_NOTES.md](IMPORTANT_NOTES.md) 了解关键代码位置和常见操作。
