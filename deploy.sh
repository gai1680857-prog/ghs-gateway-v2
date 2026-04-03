#!/bin/bash

# GHS Gateway V2 部署腳本
echo "🚀 GHS Gateway V2 部署開始"

# 檢查環境變數
if [ -z "$TOAPIS_KEY" ]; then
  echo "❌ TOAPIS_KEY 未設定"
  echo "請執行: wrangler secret put TOAPIS_KEY"
  exit 1
fi

if [ -z "$ADMIN_KEY" ]; then
  echo "❌ ADMIN_KEY 未設定"
  echo "請執行: wrangler secret put ADMIN_KEY"
  exit 1
fi

echo "✅ 必要環境變數已設定"
echo ""
echo "可選環境變數:"
echo "  GITHUB_TOKEN: ${GITHUB_TOKEN:-未設定}"
echo "  TG_TOKEN: ${TG_TOKEN:-未設定}"
echo "  TG_ADMIN_CHAT: ${TG_ADMIN_CHAT:-未設定}"
echo ""

# 部署
echo "開始部署..."
npx wrangler deploy

if [ $? -eq 0 ]; then
  echo ""
  echo "✅ 部署成功!"
  echo "📍 Worker URL: https://ghs-gateway-v2.gai1680857.workers.dev"
  echo ""
  echo "📊 測試 API:"
  echo "  curl https://ghs-gateway-v2.gai1680857.workers.dev/api/health"
else
  echo "❌ 部署失敗"
  exit 1
fi
