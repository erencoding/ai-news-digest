---
name: ai-news-digest
description: 多源 AI 资讯汇总，汇聚 smol.ai、TechCrunch、The Decoder、MarkTechPost、DeepMind、BAIR、KDnuggets、The Batch、Hacker News、Artificial Analysis 等源。自动抓取并生成带中文摘要和源链接的结构化日报，同时包含 AI 模型排行榜。适用于询问 AI 资讯、AI 新闻、AI 日报、最新 AI 动态等场景。输出方式支持两种：① 直接回复到当前对话；② 写入飞书文档（doc_id: EAPQdnMQ6oQPARxUB5gc1qgGnC6）并推送到 GitHub。
version: "6.2"
author: Judy (朱迪)
license: MIT
---

# AI News Digest Skill (v6.0)

多源 AI 资讯汇总，覆盖 10 个权威来源。每次输出**必须包含中文摘要和源链接**，格式统一、可直接阅读。

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
| 3 | Gemini 3.1 Pro Preview | 57 分 |
| 4 | GPT-5.4 (xhigh) | 54 分 |
| 5 | Kimi K2.6 | 54 分 |
| 6 | DeepSeek V4 Pro (Max) | 52 分 |
| 7 | Qwen 3.6 27B | 51 分 |
| 8 | MiniMax-M2.7 | 50 分 |

### 速度排名 TOP 5（tokens/sec）

| # | 模型 | 速度 |
|---|---|---|
| 1 | gpt-oss-120B | 209 tps |
| 2 | NVIDIA Nemotron 3 Super | 154 tps |
| 3 | Gemini 3.1 Pro Preview | 123 tps |
| 4 | Grok 4.20 0309 v2 | 115 tps |
| 5 | Kimi K2.6 | 112 tps |

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
| **标题** | 原文保留，黑色加粗 | `### ARC-AGI-3 分析：即使最强 AI 模型也会犯三种系统性推理错误` |
| **摘要** | 必须为中文，2-3 句话说明核心内容和意义 | `**摘要**：ARC Prize Foundation 对 GPT-5.5 和 Opus 4.7 进行了 160 轮游戏重放分析，发现三种系统性错误模式。GPT-5.5 得分 0.43%（成本约 $10,000），而未经训练的人类能轻松解决相同任务。这揭示了当前 AI 系统与通用智能之间的根本差距。` |
| **日期** | 格式：YYYY-MM-DD 或 英文原文 | `📅 2026-05-02` |
| **链接** | 必须可点击，完整 URL | `📎 来源：[The Decoder](https://the-decoder.com/xxx)` |

---

## 数据来源（11个）

| # | 来源 | 类型 | 验证状态 | Fetch 方式 |
|---|---|---|---|---|
| 1 | **smol.ai** | AI Twitter/Reddit 聚合 | ✅ 正常 | 直接 curl RSS |
| 2 | **The Decoder** | AI 技术/商业/伦理深度分析 | ✅ 正常 | 直接 curl RSS |
| 3 | **TechCrunch AI** | 创业/融资/公司新闻 | ✅ 正常 | 需用代理 `-x http://127.0.0.1:7892` |
| 4 | **MarkTechPost** | AI 论文/工具/教程 | ✅ 正常 | 直接 curl 主页 |
| 5 | **DeepMind Blog** | 官方研究发布 | ⚠️ 需代理 | 代理或直接尝试 |
| 6 | **BAIR Blog** | Berkeley 学术研究 | ✅ 正常 | 直接 curl 主页 |
| 7 | **KDnuggets** | 数据科学/ML 教程 | ✅ 正常 | 直接 curl 主页 |
| 8 | **The Batch** | 吴恩达每周行业分析 | ✅ 正常 | 直接 curl 主页 |
| 9 | **Hacker News** | AI 技术讨论 | ✅ 正常 | JSON API |
| 10 | **Artificial Intelligence News** | 商业 AI 新闻 | ✅ 正常 | 直接 curl RSS |
| 11 | **Artificial Analysis** | AI 模型排行榜 | ✅ 正常 | Playwright 截图 + API |

---

### 11. Artificial Analysis AI 模型排行榜

```bash
# 截图方式（推荐，完整保留排行榜样式）
node -e "
const { chromium } = require('/usr/lib/node_modules/playwright');
(async () => {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();
  await page.setViewportSize({ width: 1400, height: 900 });
  await page.goto('https://artificialanalysis.ai/', { waitUntil: 'load', timeout: 30000 });
  await page.waitForTimeout(2000);
  await page.screenshot({ path: '/tmp/ai-leaderboard.png', fullPage: false });
  await browser.close();
})().catch(e => console.error(e.message));
" 2>&1

# 获取排行榜数据（备用，若截图失败）
curl -s --max-time 15 'https://api.artificialanalysis.ai/models/kimi-k2-6-non-reasoning' 2>&1 | python3 -c '
import sys, json
data = json.load(sys.stdin)
print(data)
' 2>&1
```

Artificial Analysis 追踪 496 个模型，包含综合智能指数、速度、价格、上下文窗口、编程能力等多个维度排名。

---

## Fetch 命令（按来源）

### 1. smol.ai（直接 curl）

```bash
curl -s --max-time 15 'https://news.smol.ai/rss.xml' 2>&1 | python3 -c '
import sys, re
from html import unescape
content = sys.stdin.read()
items = re.findall(r"<item>(.*?)</item>", content, re.DOTALL)
for item in items[:2]:
    title = re.search(r"<title>(.*?)</title>", item)
    link = re.search(r"<link>(.*?)</link>", item)
    pub = re.search(r"<pubDate>(.*?)</pubDate>", item)
    enc = re.search(r"<content:encoded><!\[CDATA\[(.*?)\]\]></content:encoded>", item, re.DOTALL)
    if title:
        t = unescape(title.group(1))
        l = link.group(1).strip() if link else ""
        p = pub.group(1)[:16] if pub else ""
        print(f"标题: {t}")
        print(f"日期: {p}")
        print(f"链接: {l}")
' 2>&1
```

---

### 2. The Decoder（直接 curl RSS）

```bash
curl -s --max-time 15 'https://the-decoder.com/feed/' 2>&1 | python3 -c '
import sys, re
from html import unescape
content = sys.stdin.read()
items = re.findall(r"<item>(.*?)</item>", content, re.DOTALL)
for item in items[:5]:
    title = re.search(r"<title>(.*?)</title>", item)
    link = re.search(r"<link>(.*?)</link>", item)
    pub = re.search(r"<pubDate>(.*?)</pubDate>", item)
    if title:
        t = unescape(title.group(1))
        l = link.group(1).strip() if link else ""
        p = pub.group(1)[:16] if pub else ""
        print(f"标题: {t}")
        print(f"日期: {p}")
        print(f"链接: {l}")
' 2>&1
```

---

### 3. TechCrunch（需用代理）

```bash
curl -s --max-time 15 -x http://127.0.0.1:7892 'https://techcrunch.com/tag/artificial-intelligence/feed/' 2>&1 | python3 -c '
import sys, re
from html import unescape
content = sys.stdin.read()
items = re.findall(r"<item>(.*?)</item>", content, re.DOTALL)
for item in items[:5]:
    title = re.search(r"<title>(.*?)</title>", item, re.DOTALL)
    link = re.search(r"<link>(.*?)</link>", item, re.DOTALL)
    pub = re.search(r"<pubDate>(.*?)</pubDate>", item)
    if title:
        t = unescape(title.group(1))
        l = link.group(1).strip() if link else ""
        p = pub.group(1)[:16] if pub else ""
        print(f"标题: {t}")
        print(f"日期: {p}")
        print(f"链接: {l}")
' 2>&1
```

---

### 4. MarkTechPost（直接 curl）

```bash
curl -s --max-time 15 'https://www.marktechpost.com/' 2>&1 | python3 -c '
import sys, re
from html import unescape
content = sys.stdin.read()
titles = re.findall(r"class=\"entry-title td-module-title\"><a[^>]*href=\"([^\"]+)\"[^>]*>([^<]+)</a>", content)
dates = re.findall(r"entry-date updated td-module-date[^>]*>([^<]+)</time>", content)
for i, (url, title) in enumerate(titles[:6]):
    t = unescape(title).strip()
    d = dates[i] if i < len(dates) else ""
    if t and len(t) > 10:
        print(f"标题: {t}")
        print(f"日期: {d}")
        print(f"链接: {url}")
' 2>&1
```

---

### 5. BAIR Blog（直接 curl）

```bash
curl -s --max-time 15 'https://bair.berkeley.edu/blog/' 2>&1 | python3 -c '
import sys, re
from html import unescape
content = sys.stdin.read()
links = re.findall(r"/blog/\d{4}/\d{2}/\d{2}/[^\"]+", content)
titles = re.findall(r"class=\"post-link\"[^>]*>([^<]+)</a>", content)
dates = re.findall(r"<span class=\"post-meta\">([^<]+)</span>", content)
for i, l in enumerate(links[:5]):
    t = titles[i].strip() if i < len(titles) else ""
    d = dates[i].strip() if i < len(dates) else ""
    print(f"标题: {t}")
    print(f"日期: {d}")
    print(f"链接: https://bair.berkeley.edu{l}")
' 2>&1
```

---

### 6. KDnuggets（直接 curl）

```bash
curl -s --max-time 15 'https://www.kdnuggets.com/news/top-stories.html' 2>&1 | python3 -c '
import sys, re
content = sys.stdin.read()
titles = re.findall(r"class=\"[^\"]*\"[^>]*><a[^>]*href=\"(https://www\.kdnuggets\.com/[^\"]+)\"[^>]*>([^<]{20,})</a>", content)
for url, title in titles[:8]:
    t = title.strip()
    if len(t) > 15:
        print(f"标题: {t}")
        print(f"链接: {url}")
' 2>&1
```

---

### 7. The Batch（DeepLearning.AI）（直接 curl）

```bash
curl -s --max-time 15 'https://www.deeplearning.ai/the-batch/' 2>&1 | python3 -c '
import sys, re
content = sys.stdin.read()
headings = re.findall(r"<h[23][^>]*>([^<]+)</h[23]>", content)
sections = re.findall(r"the-batch/(issue-\d+|tag/[^\"]+)\"", content)
print(f"发现标题: {headings[:5]}")
' 2>&1
```

⚠️ The Batch 需要进入 issue 页面获取具体文章，URL 格式：`https://www.deeplearning.ai/the-batch/issue-{编号}/`

---

### 8. Hacker News（JSON API）

```bash
python3 -c "
import urllib.request, json, time
ids = json.loads(urllib.request.urlopen('https://hacker-news.firebaseio.com/v0/topstories.json', timeout=10).read())
ai_keywords = ['ai', 'llm', 'gpt', 'model', 'neural', 'claude', 'gemini', 'openai', 'deepseek', 'anthropic', 'mistral']
ai_stories = []
for sid in ids[:150]:
    item = json.loads(urllib.request.urlopen(f'https://hacker-news.firebaseio.com/v0/item/{sid}.json', timeout=5).read())
    title = item.get('title', '').lower()
    if any(kw in title for kw in ai_keywords):
        score = item.get('score', 0)
        url = item.get('url', f'https://news.ycombinator.com/item?id={sid}')
        ai_stories.append((score, item['title'], url))
    time.sleep(0.03)
    if len(ai_stories) >= 6:
        break
for score, title, url in sorted(ai_stories, reverse=True)[:6]:
    print(f'标题: {title}')
    print(f'分数: {score}')
    print(f'链接: {url}')
" 2>&1
```

---

### 9. Artificial Intelligence News（直接 curl RSS）

```bash
curl -s --max-time 15 'https://www.artificialintelligence-news.com/artificial-intelligence-news/' 2>&1 | python3 -c '
import sys, re
from html import unescape
content = sys.stdin.read()
print(f"Content length: {len(content)}")
' 2>&1
```

---

### 10. DeepMind Blog（需代理或直接尝试）

```bash
curl -s --max-time 15 'https://deepmind.google/blog/' 2>&1 | python3 -c '
import sys, re
content = sys.stdin.read()
items = re.findall(r"<a[^>]*href=\"(/blog/[^\"]+)\"[^>]*>([^<]+)</a>", content)
for url, title in items[:5]:
    print(f"标题: {title.strip()}")
    print(f"链接: https://deepmind.google{url}")
' 2>&1
```

---

## 输出示例（完整参考）

以下是完全符合格式的输出示例，每次执行 Skill 时必须按照此格式输出：

---

### 输出示例

```markdown
# 🤖 AI 资讯日报 · 2026年5月3日

> 汇聚 The Decoder、TechCrunch、BAIR 等源

---

## 🏎️ The Decoder 热点（5月2日）

### [1] 即使最强AI模型也会犯三种系统性推理错误——ARC-AGI-3分析
**摘要**：ARC Prize Foundation 对 GPT-5.5 和 Opus 4.7 进行了 160 轮游戏重放分析，发现三种系统性错误模式。GPT-5.5 得分 0.43%（成本约 $10,000），Opus 4.7 仅 0.18%，而未经训练的人类能轻松解决相同任务。这揭示了当前 AI 系统与通用智能之间的根本差距。
📅 2026-05-02 | 📎 来源：[The Decoder](https://the-decoder.com/even-the-latest-ai-models-make-three-systematic-reasoning-errors-arc-agi-3-analysis-shows/)

---

### [2] xAI Custom Voices：1分钟克隆声音，80+预置声音
**摘要**：xAI 发布 Custom Voices 功能，用户仅需 1 分钟语音即可克隆自己的声音，模型在 2 分钟内完成训练。该功能内置超过 80 种预置声音，覆盖 28 种语言。防滥用机制包括实时声纹验证。目前已应用于 Starlink 客服和销售。
📅 2026-05-02 | 📎 来源：[The Decoder](https://the-decoder.com/xais-new-custom-voices-feature-turns-a-minute-of-speech-into-a-usable-voice-clone/)

---

## 📰 TechCrunch AI

### [1] 数据中心需求推动天然气发电厂成本暴涨66%
**摘要**：随着 AI 数据中心需求激增，天然气发电厂成本大幅上涨 66%。这一趋势反映了 AI 行业对能源的巨大消耗，同时也暴露了数据中心扩张面临的能源挑战。
📅 2026-04-27 | 📎 来源：[TechCrunch](https://techcrunch.com/2026/04/27/data-center-demand-drives-66-surge-in-natural-gas-power-plant-costs/)

---

## 🏫 BAIR Blog 最新研究

### [1] GRASP：基于梯度的世界模型长时规划
**摘要**：Berkeley AI Research 提出 GRASP，一种基于梯度规划的新方法，用于解决长时规划问题。核心创新包括：将轨迹映射到虚拟状态以并行优化、在状态迭代中加入随机性以增强探索、重塑梯度以避免脆性"状态-输入"梯度问题。该方法在大规模视觉世界模型上展现了更强的鲁棒性，为机器人控制任务提供了新的思路。
📅 2026-04-20 | 📎 来源：[BAIR](https://bair.berkeley.edu/blog/2026/04/20/grasp/)

---

## 📊 来源汇总

| 来源 | 资讯数 | 链接 |
|---|---|---|
| The Decoder | 2条 | [进入](https://the-decoder.com/) |
| TechCrunch | 1条 | [进入](https://techcrunch.com/category/artificial-intelligence/) |
| BAIR Blog | 1条 | [进入](https://bair.berkeley.edu/blog/) |

**共抓取 4 条资讯，全部附有摘要和源链接** ✅
```

---

## 关键要求

1. **每条资讯必须有中文摘要**，不能只给标题
2. **每条资讯必须有可点击的源链接**
3. **最后必须有来源汇总表**，注明条数和链接
4. **所有日期必须标注**
5. **格式统一**，便于阅读
6. **输出方式**：默认直接回复；如需写入飞书文档，用户会明确说明

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

- TechCrunch 必须加代理：`-x http://127.0.0.1:7892`
- DeepMind 可能需要代理，不行就跳过
- Hacker News 连接慢时等待或跳过
- 每条摘要是中文，2-3 句话，说明 WHY it matters
- 输出语言：全部中文（摘要、标题、格式都是中文）