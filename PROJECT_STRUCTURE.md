# PaperMod 项目结构说明

## 目录树

```
sonic-theme-papermod/
│
├── 📄 README.md                # 项目说明
├── 📄 LICENSE                      # MIT 许可证
├── 📄 theme.yaml                # 主题元数据
├── 📄 settings.yaml                # 主题设置配置
├── 📄 screenshot.png               # 主题截图
│
├── 📁 docs/                 # 📚 文档目录
│   ├── SETUP.md             # 安装和配置指南
│   ├── AI_SETUP_GUIDE.md          # AI 开发者指南
│   ├── COMMENTS_INTEGRATION.md     # 评论框架集成指南
│   └── THEME_SETTINGS_ANALYSIS.md # 主题参数保存机制分析
│
├── 📁 templates/                   # 🎨 模板文件目录
│   ├── archives.tmpl            # 归档页面
│   ├── categories.tmpl             # 分类列表页面
│   ├── category.tmpl               # 分类页面
│   ├── index.tmpl                  # 首页
│   ├── post.tmpl             # 文章页面
│   ├── sheet.tmpl                  # 单页面
│   ├── tag.tmpl                 # 标签页面
│   ├── tags.tmpl                   # 标签列表页面
│   │
│   └── 📁 module/            # 模块化组件
│       ├── head.tmpl               # HTML head 部分
│       ├── header.tmpl             # 页面头部
│       ├── footer.tmpl             # 页面底部
│       ├── comments.tmpl           # 评论框架
│       └── post-entry.tmpl         # 文章条目组件
│
├── 📁 assets/                      # 🎯 静态资源
│   └── main.css                    # 主样式表
│
├── 📁 scripts/             # 🔧 工具脚本
│   ├── check-ai-init.sh      # AI 初始化检查脚本
│   └── install-git-hooks.sh       # Git Hook 安装脚本
│
├── 📁 examples/              # 📋 示例配置
│   └── settings-example.yaml      # settings.yaml 示例
│
├── 📁 .ai/               # 🤖 AI 知识库系统
│   ├── MUST_READ_FIRST.md
│   └── AI_INIT_REMINDER.md
│
└── 📁 .git/                    # Git 版本控制目录

```

## 文件说明

### 根目录文件

| 文件 | 说明 |
|------|------|
| `theme.yaml` | 主题元数据（名称、版本、作者等） |
| `settings.yaml` | 主题设置定义（后台表单配置） |
| `screenshot.png` | 主题预览图片 |
| `README.md` | 项目说明 |
| `LICENSE` | MIT 许可证 |

### docs/ - 文档目录

存放所有文档和指南：

- **SETUP.md** - 安装、配置和快速开始指南
- **AI_SETUP_GUIDE.md** - AI 开发者工作流程
- **COMMENTS_INTEGRATION.md** - 常见评论框架集成指南（Artalk、Waline 等）
- **THEME_SETTINGS_ANALYSIS.md** - 主题参数保存机制详解

### templates/ - 模板文件目录

所有 Sonic 模板文件，使用 Go template 语法：

**主页面模板：**
- `index.tmpl` - 首页
- `post.tmpl` - 文章详情页
- `archives.tmpl` - 归档页面
- `categories.tmpl` / `category.tmpl` - 分类相关
- `tags.tmpl` / `tag.tmpl` - 标签相关
- `sheet.tmpl` - 单页面（如"关于"页）

**module/ 目录 - 可复用模块组件：**
- `head.tmpl` - HTML head（meta、title、CSS等）
- `header.tmpl` - 页面头部导航栏
- `footer.tmpl` - 页面底部
- `comments.tmpl` - 评论框架（支持多种评论系统）
- `post-entry.tmpl` - 文章列表项组件

### assets/ - 静态资源目录

- `main.css` - 主样式表（包含浅色/深色主题）

### scripts/ - 脚本目录

- `check-ai-init.sh` - 检查 AI 开发环境是否初始化
- `install-git-hooks.sh` - 自动安装 Git Hooks

### examples/ - 示例配置目录

- `settings-example.yaml` - settings.yaml 的完整示例，展示所有可用配置选项

## 关键文件关系

```
设置流程：
settings.yaml (定义) → Sonic 后台 (UI表单) → 数据库 (保存) → 模板 (渲染)
                       ↓
                      .settings.参数名 (访问)

例子：
settings.yaml 定义 comment_code
        ↓
Sonic 后台显示评论代码输入框
        ↓
用户输入并保存
        ↓
数据库存储
      ↓
templates/module/comments.tmpl 中使用 .settings.comment_code
        ↓
页面渲染时加载评论框架
```

## 快速导航

### 想要...请查看

| 任务 | 文件 |
|------|------|
| 修改网站标题 | `settings.yaml` / 后台设置 |
| 自定义页面头部 | `templates/module/header.tmpl` |
| 修改样式 | `assets/main.css` |
| 添加评论框架 | `docs/COMMENTS_INTEGRATION.md` |
| 理解参数保存机制 | `docs/THEME_SETTINGS_ANALYSIS.md` |
| 修改文章页布局 | `templates/post.tmpl` |
| 调整首页显示 | `templates/index.tmpl` |
| 增加新的 SNS 链接 | `settings.yaml` + `templates/index.tmpl` |

## 开发注意事项

1. **修改模板后需重启 Sonic**
   - 大多数改动需要重启才能生效

2. **修改 settings.yaml 后需重启 Sonic**
   - 新的参数定义需要重新加载

3. **CSS 修改无需重启**
   - 可以通过浏览器刷新查看效果（可能需要清除缓存）

4. **参数访问方式**
   ```gotmpl
   {{ .settings.参数名 }}           <!-- 访问设置参数 -->
   {{ .post.Title }}               <!-- 访问文章标题 -->
   {{ .blog_title }}               <!-- 访问博客标题 -->
   {{ .user.Nickname }}            <!-- 访问用户昵称 -->
   ```

## 相关资源

- [Sonic 官方文档](https://github.com/go-sonic/sonic)
- [Go Template 文档](https://golang.org/pkg/text/template/)
- [Hugo PaperMod（原项目）](https://github.com/adityatelange/hugo-PaperMod)

---

**最后更新**：2026年2月21日
