---
name: ai-news-digest
description: Fetches and summarizes latest AI news from smol.ai RSS combined with GitHub top AI projects. Use when user asks about AI news digest, latest AI updates, or combined AI information with GitHub stars.
version: "1.0"
author: Judy (朱迪)
license: MIT
---

# AI News Digest Skill

Fetches latest AI news from smol.ai RSS combined with GitHub top starred AI projects.

## Usage Keywords

```
AI资讯
AI新闻
AI日报
AI动态
最新AI
整合AI资讯
AI digest
```

## Workflow

### Step 1: Fetch AI News from smol.ai

```bash
cd /root/.openclaw/workspace/.agents/skills/ai-daily-news && python3 scripts/fetch_news.py --date $(date -d 'yesterday' +%Y-%m-%d) 2>&1
```

If no content for yesterday, try today or the day before:
```bash
cd /root/.openclaw/workspace/.agents/skills/ai-daily-news && python3 scripts/fetch_news.py --date $(date +%Y-%m-%d) 2>&1
```

### Step 2: Fetch GitHub Top AI Projects

```bash
curl -s "https://api.github.com/search/repositories?q=AI+language:python+stars:>10000&sort=stars&order=desc&per_page=10" \
  -H "Accept: application/vnd.github.v3+json" 2>&1 | python3 -c "
import sys, json
data = json.load(sys.stdin)
print('**🏆 GitHub 高星 AI 项目 TOP 10**\n')
print('| # | 项目 | ⭐ | 语言 |')
print('|---|---|---|---|')
for i, r in enumerate(data['items'][:10], 1):
    lang = r['language'] or '—'
    print(f'| {i} | [{r[\"name\"]}]({r[\"html_url\"]}) | {r[\"stargazers_count\"]:,} | {lang} |')
"
```

### Step 3: Analyze and Format News

Use the fetched smol.ai content to create a structured summary:

```
# 🌐 AI 资讯整合 · {DATE}

## 🔥 本周最重大事件
{Main story - extract key facts, model names, numbers, prices}

## 📱 行业动态
{Summarize other notable news: OpenAI, Google, funding, etc.}

## 🛠️ 工具与生态
{Tools, model releases, updates}

## 🏆 GitHub 高星 AI 项目 TOP 10
{Table from Step 2}

来源: smol.ai + GitHub
```

### Step 4: Reply

Send the formatted digest directly in the current conversation via message tool.

## Output Format Example

```
# 🌐 AI 资讯整合 · 2026-04-24

## 🔥 本周最重大事件
**DeepSeek V4 发布 — 开源模型新标杆**
| 项目 | 数据 |
| V4 Pro | 1.6T 总参 / 49B 活跃，$1.74/1M token |
| V4 Flash | 284B 总参 / 13B 活跃，$0.14/1M token |
| 上下文 | 1M token |
| 排名 | #2 开源推理模型 |

## 📱 行业动态
- OpenAI: GPT-5.5 上线 API，CursorBench 72.8%
- Google: 传将投资 Anthropic $400 亿
- ComfyUI 融资 $3000 万

## 🛠️ 工具与生态
- Claude Code: 3 bug 修复，限额重置
- Qwen 3.6 27B: Mac 本地跑出惊人效果

## 🏆 GitHub 高星 AI 项目 TOP 10
| # | 项目 | ⭐ | 语言 |
|---|---|---|---|
| 1 | AutoGPT | 183,758 | Python |
...

来源: smol.ai + GitHub
```

## Notes
- News source: smol.ai RSS (https://news.smol.ai/rss.xml)
- GitHub repos: REST API, 10k+ stars, Python AI projects
- If smol.ai returns no content for date, try today's date
- Combine news analysis + GitHub stars in one response