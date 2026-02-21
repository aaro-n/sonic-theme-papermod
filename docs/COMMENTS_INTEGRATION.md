# 评论框架集成指南

本文档介绍如何在 PaperMod 主题中集成常见的评论框架。

## 目录
- [Artalk](#artalk)
- [Waline](#waline)
- [Valine](#valine)
- [Disqus](#disqus)
- [utterances](#utterances)

---

## Artalk

Artalk 是一个自托管的评论系统，支持匿名评论、邮件通知等功能。

### 安装步骤

1. **编辑 `settings.yaml`**，添加评论代码：

```yaml
comment_code: |
  <link href="//mirrors.sustech.edu.cn/cdnjs/ajax/libs/artalk/2.9.1/ArtalkLite.css" rel="stylesheet"/>
  <script src="//mirrors.sustech.edu.cn/cdnjs/ajax/libs/artalk/2.9.1/ArtalkLite.js"></script>
  
  <!-- Artalk -->
  <div id="comment"></div>
  
  <script>
    Artalk.init({
      pageKey: window.location.pathname,
      el: '#comment',
    pageTitle: document.title,
      server: 'https://artalk.example.com',
      site: document.querySelector('.logo a')?.textContent || 'Blog',
      placeholder: '如果感觉对你有帮助，欢迎留言。\n评论注意事项：不欢迎垃圾、仇恨及其他令人感到不适的评论。\n隐私声明：发表评论后台会记录评论者的IP，请注意。',
      useBackendConf: false,
      flatMode: 'auto',
      imgUpload: false,
      versionCheck: false,
      gravatar: {
        default: 'mp',
        mirror: '//gravatar.ews1.com/avatar/',
      },
      locale: 'zh-CN',
      darkMode: 'auto',
      emoticons: false,
    })
  </script>
```

### 关键配置说明

| 参数 | 说明 | 示例值 |
|-----|--------|
| `pageKey` | 页面唯一标识 | `window.location.pathname` |
| `pageTitle` | 页面标题 | `document.title` |
| `server` | Artalk 服务器地址 | `https://talk.itansuo.info` |
| `site` | 网站名称（从 DOM 动态获取） | `document.querySelector('.logo a')?.textContent` |
| `locale` | 语言设置 | `zh-CN` |
| `darkMode` | 暗黑模式 | `auto` |

### 优化建议

如需在评论框架前添加间距，编辑 `post.tmpl`：

```html
<style>
  .comments-section {
    margin-top: 60px;
  }
</style>

<div class="comments-section">
{{ template "sonic_theme_paper_mod/module/comments" . }}
</div>
```

---

## Waline

Waline 是一个 Vercel 无服务器评论系统，支持多种评论功能。

### 安装步骤

1. **部署 Waline**：参考 [Waline 官方文档](https://waline.js.org/)

2. **编辑 `settings.yaml`**：

```yaml
comment_code: |
  <script async defer src="https://cdn.jsdelivr.net/npm/@waline/client"></script>
  <div id="waline"></div>
  <script>
    Waline.init({
      el: '#waline',
      serverURL: 'https://your-waline-server.vercel.app',
      lang: 'zh-CN',
      dark: 'auto',
    });
  </script>
```

### 关键配置说明

| 参数 | 说明 |
|-----|------|
| `serverURL` | Waline 服务器地址 |
| `lang` | 语言设置 |
| `dark` | 暗黑模式支持 |

---

## Valine

Valine 是一个基于 LeanCloud 的评论系统。

### 安装步骤

1. **申请 LeanCloud 账户**：[LeanCloud 官网](https://leancloud.cn/)

2. **编辑 `settings.yaml`**：

```yaml
comment_code: |
  <script src="//cdn.jsdelivr.net/npm/leancloud-storage@4.15.1/dist/av-min.js"></script>
  <script src='//cdn.jsdelivr.net/npm/valine@1.4.14/dist/Valine.min.js'></script>
  <div id="vcomments"></div>
  <script>
    new Valine({
      el: '#vcomments',
      appId: 'YOUR_LEANCLOUD_APP_ID',
      appKey: 'YOUR_LEANCLOUD_APP_KEY',
      lang: 'zh-CN',
      avatar: 'mp',
      dark: 'auto',
    })
  </script>
```

### 关键配置说明

| 参数 | 说明 |
|-----|------|
| `appId` | LeanCloud App ID |
| `appKey` | LeanCloud App Key |
| `avatar` | 评论者头像方案 |

---

## Disqus

Disqus 是国际通用的评论系统。

### 安装步骤

1. **注册 Disqus**：[Disqus 官网](https://disqus.com/)

2. **编辑 `settings.yaml`**：

```yaml
comment_code: |
  <div id="disqus_thread"></div>
  <script>
    var disqus_config = function () {
      this.page.url = window.location.href;
      this.page.identifier = window.location.pathname;
    };
    (function() {
      var d = document, s = d.createElement('script');
      s.src = 'https://YOUR_DISQUS_SHORTNAME.disqus.com/embed.js';
      s.setAttribute('data-timestamp', +new Date());
      (d.head || d.body).appendChild(s);
    })();
  </script>
  <noscript>Please enable JavaScript to view the comments</noscript>
```

---

## utterances

utterances 是基于 GitHub Issues 的评论系统，适合技术博客。

### 安装步骤

1. **创建 GitHub 仓库**用于评论存储

2. **编辑 `settings.yaml`**：

```yaml
comment_code: |
  <script src="https://utteranc.es/client.js"
    repo="YOUR_GITHUB_USERNAME/YOUR_REPO_NAME"
    issue-term="pathname"
    theme="github-light"
    crossorigin="anonymous"
    async>
  </script>
```

### 关键配置说明

| 参数 | 说明 |
|-----|------|
| `repo` | GitHub 仓库（格式：username/repo） |
| `issue-term` | 映射方式：pathname、url、title 等 |
| `theme` | 主题：github-light、github-dark 等 |

---

## 常见问题

### Q1：如何获取动态的网站名称？

在 JavaScript 中使用 DOM 选择器：

```javascript
site: document.querySelector('.logo a')?.textContent || 'Blog'
```

这会从页面的 `.logo a` 元素中提取文本。

### Q2：如何添加评论框架的上方间距？

在 `post.tmpl` 中添加样式：

```html
<style>
  .comments-section {
    margin-top: 60px;  /* 调整数值以改变间距 */
  }
</style>
```
### Q3：支持暗黑模式吗？

大多数评论框架都支持 `dark: 'auto'` 设置，会自动根据系统设置切换。

### Q4：如何修改评论框架的容器 ID？

在 `comments.tmpl` 模板中修改 `el` 参数即可，对应的 HTML 中也要修改 `id`。

---

## 推荐配置

针对 PaperMod 主题的推荐配置：

1. **最简洁**：utterances（无需后端，适合技术博客）
2. **功能最全**：Artalk（自托管，功能完整）
3. **开箱即用**：Waline（Vercel 部署简单）

---

## 相关文件

- `settings.yaml` - 主题配置文件
- `post.tmpl` - 文章页面模板
- `module/comments.tmpl` - 评论框架模块

---

最后更新：2026年2月21日
