import SwiftUI

// 全局狀態管理器，負責管理應用的共享狀態（選中的分類、模板）和數據（shortcuts、templates）
class AppState: ObservableObject {
    @Published var selectedCategory: ShortcutCategory? = nil
    @Published var selectedTemplate: ShortcutTemplate? = nil
    @Published var shortcuts: [Shortcut] = []
    
    // 預設模板數據
    let templates: [ShortcutTemplate] = [
        ShortcutTemplate(category: .productivity, name: "Email Schedule to Yourself", iCloudLink: "https://www.icloud.com/shortcuts/2dfd3256100a4fea97b81a11c3d47cf4"),
        ShortcutTemplate(category: .aiTools, name: "Summarize Text Perplexity", iCloudLink: "https://www.icloud.com/shortcuts/1849854a41be449081c953b5c3d24a90"),
        ShortcutTemplate(category: .aiTools, name: "GPT Writing Tools", iCloudLink: "https://www.icloud.com/shortcuts/dd234dbd5d8442e8927e320fa3b02071"),
        ShortcutTemplate(category: .lifeHack, name: "Check my app subscriptions", iCloudLink: "https://www.icloud.com/shortcuts/52f49a5b1f3047119c113528dc8c99fc"),
        ShortcutTemplate(category: .productivity, name: "Daily Screenshot Cleaner", iCloudLink: "https://www.icloud.com/shortcuts/a7b474f365c243a6ae0bf14b79891a2e"),
        ShortcutTemplate(category: .wellBeing, name: "Word of the Day", iCloudLink: "https://www.icloud.com/shortcuts/3e8d41fe89134d2e84009aa3a16aa700")
    ]
    
    var filteredTemplates: [ShortcutTemplate] {
        guard let category = selectedCategory else { return templates }
        return templates.filter { $0.category == category }
    }
} 