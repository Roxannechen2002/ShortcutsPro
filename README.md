# ShortcutsPro

ShortcutsPro 是一個 iOS 應用程序，旨在幫助用戶管理和組織他們的 iOS 快捷指令（Shortcuts）。

## 功能特點

- 快捷指令分類管理
- 收藏夾功能
- 快捷指令詳細信息查看
- 快速導入快捷指令
- SwiftData 本地數據存儲

## 技術架構

- **SwiftUI**: 用於構建用戶界面
- **SwiftData**: 用於數據持久化
- **iOS 17+**: 支持最新的 iOS 特性

## 主要組件

### 模型（Models）

1. **Shortcut**
   - 快捷指令的核心數據模型
   - 包含名稱、描述、分類、收藏狀態等屬性
   - 使用 SwiftData 進行管理

2. **ShortcutCategory**
   - 快捷指令分類枚舉
   - 包含：AI Tools、Productivity、Life Hack、Well Being
   - 每個分類都有對應的圖標

3. **ShortcutTemplate**
   - 快捷指令模板結構
   - 包含分類、名稱和 iCloud 鏈接

### 視圖（Views）

1. **ContentView**
   - 應用程序的主要視圖
   - 負責整體導航和佈局

2. **ShortcutDetailView**
   - 顯示快捷指令的詳細信息
   - 包含名稱、描述、分類和收藏狀態

3. **CategoryButton**
   - 自定義分類按鈕組件
   - 支持選中狀態顯示
   - 包含圖標和文字標籤

## 當前進度

- [x] 基礎數據模型設計完成
- [x] SwiftData 集成
- [x] 分類系統實現
- [x] 基礎 UI 組件開發
- [ ] 快捷指令導入功能
- [ ] 用戶數據持久化
- [ ] UI 優化和測試

## 待辦事項

1. 完善 ContentView 的實現
2. 添加快捷指令導入功能的錯誤處理
3. 實現快捷指令搜索功能
4. 添加用戶設置頁面
5. 優化 UI/UX 設計
6. 添加單元測試

## 系統要求

- iOS 17.0 或更高版本
- Xcode 15.0 或更高版本

## 安裝說明

1. 克隆專案存儲庫
2. 使用 Xcode 打開專案
3. 選擇目標設備或模擬器
4. 構建並運行專案

## 貢獻指南

歡迎提交 Pull Requests 來改進專案。在提交之前，請確保：

1. 代碼符合項目的編碼規範
2. 添加適當的註釋和文檔
3. 確保所有現有測試都能通過

## 許可證

本專案採用 MIT 許可證。詳情請參見 LICENSE 文件。 