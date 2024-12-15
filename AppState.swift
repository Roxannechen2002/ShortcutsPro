//// 全局狀態管理器，負責管理應用的共享狀態（選中的分類、模板）和數據（shortcuts、templates）
import SwiftUI

class AppState: ObservableObject {
    @Published var selectedCategory: ShortcutCategory? = nil
    @Published var selectedTemplate: ShortcutTemplate? = nil
    @Published var shortcuts: [Shortcut] = []
    // MARK: - 自定義數據存取邏輯

    /// 用於設置數據的方法，將數據值與指定鍵綁定
    /// - Parameters:
    ///   - value: 要存儲的數據值
    ///   - key: 與數據綁定的鍵名稱
    func setValue<T>(_ value: T, forKey key: String) {
        // TODO: 實現數據存取邏輯，如存儲到 UserDefaults 或資料庫
        print("設置值: \(value)，鍵: \(key)")
    }

    /// 用於獲取數據的方法，根據鍵返回對應的數據值
    /// - Parameter key: 與數據綁定的鍵名稱
    /// - Returns: 綁定到指定鍵的數據值，如果沒有則返回 nil
    func getValue<T>(forKey key: String) -> T? {
        // TODO: 實現數據檢索邏輯，如從 UserDefaults 或資料庫獲取
        print("獲取鍵: \(key) 的值")
        return nil // 此處返回 nil，待實現具體邏輯
    }

    // 預設模板數據
    let templates: [ShortcutTemplate] = [
        ShortcutTemplate(
            category: .productivity,
            name: "Email Schedule to Yourself",
            iCloudLink: "https://www.icloud.com/shortcuts/2dfd3256100a4fea97b81a11c3d47cf4",
            iconName: "envelope.fill", // 圖標：信封，表示郵件相關
            relatedTemplateID: nil // 沒有關聯模板時設置為 nil
        ),
        ShortcutTemplate(
            category: .aiTools,
            name: "Summarize Text Perplexity",
            iCloudLink: "https://www.icloud.com/shortcuts/1849854a41be449081c953b5c3d24a90",
            iconName: "brain.head.profile", // 圖標：大腦，表示 AI 分析工具
            relatedTemplateID: nil
        ),
        ShortcutTemplate(
            category: .aiTools,
            name: "GPT Writing Tools",
            iCloudLink: "https://www.icloud.com/shortcuts/dd234dbd5d8442e8927e320fa3b02071",
            iconName: "pencil.and.outline", // 圖標：鉛筆，表示寫作工具
            relatedTemplateID: nil
        ),
        ShortcutTemplate(
            category: .lifeHack,
            name: "Check my app subscriptions",
            iCloudLink: "https://www.icloud.com/shortcuts/52f49a5b1f3047119c113528dc8c99fc",
            iconName: "list.bullet.rectangle.portrait", // 圖標：列表，表示檢查訂閱
            relatedTemplateID: nil
        ),
        ShortcutTemplate(
            category: .productivity,
            name: "Daily Screenshot Cleaner",
            iCloudLink: "https://www.icloud.com/shortcuts/a7b474f365c243a6ae0bf14b79891a2e",
            iconName: "camera.viewfinder", // 圖標：相機，表示截圖清理
            relatedTemplateID: nil
        ),
        ShortcutTemplate(
            category: .wellBeing,
            name: "Word of the Day",
            iCloudLink: "https://www.icloud.com/shortcuts/3e8d41fe89134d2e84009aa3a16aa700",
            iconName: "book.fill", // 圖標：書本，表示每日詞彙
            relatedTemplateID: nil
        )
    ]

    
    var filteredTemplates: [ShortcutTemplate] {
        guard let category = selectedCategory else { return templates }
        return templates.filter { $0.category == category }
    }
} 
