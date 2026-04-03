-- GHS Gateway V2 — D1 初始化 Migration
-- 執行方式：npx wrangler d1 execute ghs-ops-db --file=migrations/0001_init.sql

CREATE TABLE IF NOT EXISTS faq (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category TEXT NOT NULL,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  active INTEGER DEFAULT 1,
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS announcements (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  active INTEGER DEFAULT 1,
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS suggestions (
  id TEXT PRIMARY KEY,
  date TEXT NOT NULL,
  content TEXT NOT NULL,
  generated_at TEXT NOT NULL,
  status TEXT DEFAULT 'active'
);

-- 初始 FAQ 資料
INSERT INTO faq (category, question, answer, sort_order) VALUES
('入金', '最低入金多少？', '最低入金 100 元，建議首充 500 元以上可享首充優惠。', 1),
('入金', '入金方式有哪些？', '支援超商代碼、ATM 轉帳、虛擬幣 USDT。', 2),
('入金', '入金多久到帳？', '超商代碼：5-15 分鐘；ATM 轉帳：即時到帳；USDT：區塊確認後 3-10 分鐘。', 3),
('入金', '入金沒到帳怎麼辦？', '請聯繫線上客服，提供訂單編號和截圖，我們會優先處理。', 4),
('出金', '出金流程？', '會員中心 → 出金申請 → 填入金額和銀行帳戶 → 等待審核。', 5),
('出金', '審核要多久？', '一般 30 分鐘內完成，高峰時段可能需要 1-2 小時。', 6),
('出金', '最低出金多少？', '最低出金 500 元。', 7),
('出金', '什麼是打碼量？', '打碼量 = 存款金額 × 規定倍數。需達到打碼量才能出金，防止洗錢。', 8);

-- 初始公告
INSERT INTO announcements (title, content, active) VALUES
('愚樂連假狂歡月活動開始！', '4月份多項優惠活動同步上線，包含首充送、VIP 續充加碼、老虎機排行榜等，歡迎參與！', 1),
('客服時間調整通知', '即日起客服時間調整為 10:00-02:00，其餘時間可透過 LINE 留言，我們將盡快回覆。', 1);
