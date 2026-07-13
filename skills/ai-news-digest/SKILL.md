---
name: ai-news-digest
description: "多源 AI 资讯汇总，汇聚 smol.ai、TechCrunch、The Decoder、MarkTechPost、DeepMind、BAIR、KDnuggets、The Batch、Hacker News、Artificial Analysis 等源。自动抓取并生成带中文摘要和源链接的结构化日报，同时包含 AI 模型排行榜。适用于询问 AI 资讯、AI 新闻、AI 日报、最新 AI 动态等场景。"
version: "7.0"
author: Judy (朱迪)
license: MIT
---

# AI News Digest Skill (v7.0)

多源 AI 资讯汇总，覆盖 11 个权威来源。每次输出**必须包含中文摘要和源链接**，格式统一、可直接阅读。

---

## 输出方式

用户可以选择输出方式：

### 方式一：直接回复（默认）
直接输出 AI 资讯日报到当前对话。

### 方式二：写入飞书文档
将 AI 资讯日报追加到飞书文档，并推送到 GitHub。

- 飞书文档：https://www.feishu.cn/docx/EAPQdnMQ6oQPARxUB5gc1qgGnC6
- doc_id: `EAPQdnMQ6oQPARxUB5gc1qgGnC6`
- 仓库：https://github.com/erencoding/ai-news-digest-skill（GitHub Actions 自动同步文档）

**操作流程**：
1. 抓取各来源资讯
2. 生成 Markdown 日报
3. 调用 `feishu_update_doc` 追加到文档（mode=append）
4. 回复用户已完成写入

## 触发关键词

```
AI资讯
AI新闻
AI日报
AI动态
最新AI
多源AI
AI digest
AI汇总
今日AI
```

---

## 参考输出格式（必须严格遵循）

每次输出必须包含以下结构，**不可省略任何字段**：

```markdown
# 🤖 AI 资讯日报 · {YYYY年MM月DD日}

> 汇聚 TechCrunch、The Decoder、MarkTechPost、DeepMind、BAIR、KDnuggets、The Batch 等源

---

## 🏎️ The Decoder 热点

### [1] {新闻标题}
**摘要**：{核心信息 + 为什么重要，2-3 句话}

📅 {日期} | 📎 来源：[The Decoder]({链接})

---

## 📰 TechCrunch AI

### [1] {新闻标题}
**摘要**：{核心信息 + 为什么重要，2-3 句话}

📅 {日期} | 📎 来源：[TechCrunch]({链接})

---

## 🏆 AI 模型排行榜（Artificial Analysis）

### 综合智能指数 TOP 10

| # | 模型 | 得分 |
|---|---|---|
| 1 | GPT-5.5 (xhigh) | 60 分 |
| 2 | Claude Opus 4.7 (max) | 57 分 |

### 速度排名 TOP 5（tokens/sec）

| # | 模型 | 速度 |
|---|---|---|
| 1 | gpt-oss-120B | 209 tps |

📎 完整榜单：https://artificialanalysis.ai | 🤖 496 个模型追踪

---

## 📊 来源汇总

| 来源 | 资讯数 | 链接 |
|---|---|---|
| The Decoder | X条 | [进入](https://the-decoder.com/) |
| TechCrunch | X条 | [进入](https://techcrunch.com/category/artificial-intelligence/) |
| ... | ... | ... |
| Artificial Analysis | 排行榜 | [进入](https://artificialanalysis.ai/) |

**共抓取 X 条资讯，全部附有摘要和源链接** ✅
```

---

## 必填字段说明

| 字段 | 要求 | 示例 |
|---|---|---|
| **标题** | 原文保留，黑色加粗 | `### ARC-AGI-3 分析` |
| **摘要** | 必须为中文，2-3 句话说明核心内容和意义 | `**摘要**：ARC Prize Foundation 发现三种系统性错误模式...` |
| **日期** | 格式：YYYY-MM-DD 或 英文原文 | `📅 2026-05-02` |
| **链接** | 必须可点击，完整 URL | `📎 来源：[The Decoder](https://the-decoder.com/xxx)` |

---

## 数据来源（11个）

| # | 来源 | 类型 | 验证状态 | 抓取方式 |
|---|---|---|---|---|
| 1 | **smol.ai** | AI Twitter/Reddit 聚合 | ✅ 正常 | RSS feed |
| 2 | **The Decoder** | AI 技术/商业/伦理深度分析 | ✅ 正常 | RSS feed |
| 3 | **TechCrunch AI** | 创业/融资/公司新闻 | ✅ 正常 | RSS feed（需代理） |
| 4 | **MarkTechPost** | AI 论文/工具/教程 | ✅ 正常 | HTML 解析 |
| 5 | **DeepMind Blog** | 官方研究发布 | ⚠️ 需代理 | HTML 解析 |
| 6 | **BAIR Blog** | Berkeley 学术研究 | ✅ 正常 | HTML 解析 |
| 7 | **KDnuggets** | 数据科学/ML 教程 | ✅ 正常 | HTML 解析 |
| 8 | **The Batch** | 吴恩达每周行业分析 | ✅ 正常 | HTML 解析 |
| 9 | **Hacker News** | AI 技术讨论 | ✅ 正常 | JSON API |
| 10 | **Artificial Intelligence News** | 商业 AI 新闻 | ✅ 正常 | HTML 解析 |
| 11 | **Artificial Analysis** | AI 模型排行榜 | ✅ 正常 | Playwright 截图 |

---

## URL 汇总

| 来源 | URL |
|---|---|
| smol.ai | https://news.smol.ai/rss.xml |
| The Decoder | https://the-decoder.com/feed/ |
| TechCrunch | https://techcrunch.com/tag/artificial-intelligence/feed/ |
| MarkTechPost | https://www.marktechpost.com/ |
| DeepMind | https://deepmind.google/blog/ |
| BAIR Blog | https://bair.berkeley.edu/blog/ |
| KDnuggets | https://www.kdnuggets.com/news/top-stories.html |
| The Batch | https://www.deeplearning.ai/the-batch/ |
| Hacker News | https://hacker-news.firebaseio.com/v0/topstories.json |
| AI News | https://www.artificialintelligence-news.com/artificial-intelligence-news/ |
| Artificial Analysis | https://artificialanalysis.ai/ |

---

## 注意事项

- TechCrunch 需代理访问
- DeepMind 可能需要代理，不行就跳过
- Hacker News 连接慢时等待或跳过
- 每条摘要是中文，2-3 句话，说明 WHY it matters
- 输出语言：全部中文（摘要、标题、格式都是中文）
