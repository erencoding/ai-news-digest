#!/bin/bash
# 获取 Google Trends AI 热搜趋势（使用 pytrends）

python3 -c "
from pytrends.request import TrendReq
import datetime

pytrends = TrendReq(hl='zh-CN', tz=480)

# AI 相关关键词趋势
kw_list = ['AI', 'ChatGPT', 'Claude', 'Gemini', 'LLM']
pytrends.build_payload(kw_list, cat=0, timeframe='now 7-d', geo='', gprop='')
interest = pytrends.interest_over_time()

print('=== AI 关键词近7日搜索趋势 ===')
if not interest.empty:
    latest = interest.iloc[-1]
    ranked = sorted(latest.items(), key=lambda x: x[1], reverse=True)
    for kw, score in ranked:
        if kw != 'isPartial':
            print(f'{kw}: {score}')

# 相关热门查询
print()
print('=== 相关热门查询 ===')
related = pytrends.related_queries()
for kw in kw_list[:3]:
    top = related.get(kw, {}).get('top')
    if top is not None and not top.empty:
        print(f'[ {kw} ]')
        for _, row in top.head(3).iterrows():
            print(f'  {row[\"query\"]}: {row[\"value\"]}')
" 2>&1
