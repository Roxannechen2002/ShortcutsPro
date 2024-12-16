// 定義模板的數據結構（如 ShortcutTemplate），描述每個模板的屬性，例如名稱、分類、鏈接等。

import Foundation

// 定义模板的属性和动态功能
struct ShortcutTemplate: Identifiable, Equatable {
    let id = UUID() // 唯一标识符
    let category: ShortcutCategory // 模板的分类
    let name: String // 模板的名字
    let iCloudLink: String // 模板的 iCloud 链接
    let iconName: String // 模板的图标
    let relatedTemplateID: UUID? // 关联模板的 ID（可选）
    
    
    // 靜態屬性，包含所有模板資料
        static let allTemplates: [ShortcutTemplate] = [
            ShortcutTemplate(
                category: .productivity,
                name: "Email Schedule to Yourself",
                iCloudLink: "https://www.icloud.com/shortcuts/2dfd3256100a4fea97b81a11c3d47cf4",
                iconName: "envelope.fill",
                relatedTemplateID: nil
            ),
            ShortcutTemplate(
                category: .aiTools,
                name: "Summarize Text Perplexity",
                iCloudLink: "https://www.icloud.com/shortcuts/1849854a41be449081c953b5c3d24a90",
                iconName: "brain.head.profile",
                relatedTemplateID: nil
            ),
            ShortcutTemplate(
                category: .aiTools,
                name: "GPT Writing Tools",
                iCloudLink: "https://www.icloud.com/shortcuts/dd234dbd5d8442e8927e320fa3b02071",
                iconName: "pencil.and.outline",
                relatedTemplateID: nil
            ),
            ShortcutTemplate(
                category: .lifeHack,
                name: "Check my app subscriptions",
                iCloudLink: "https://www.icloud.com/shortcuts/52f49a5b1f3047119c113528dc8c99fc",
                iconName: "list.bullet.rectangle.portrait",
                relatedTemplateID: nil
            ),
            ShortcutTemplate(
                category: .lifeHack,
                name: "Daily Screenshot Cleaner",
                iCloudLink: "https://www.icloud.com/shortcuts/a7b474f365c243a6ae0bf14b79891a2e",
                iconName: "camera.viewfinder",
                relatedTemplateID: nil
            ),
            ShortcutTemplate(
                category: .wellBeing,
                name: "Word of the Day",
                iCloudLink: "https://www.icloud.com/shortcuts/3e8d41fe89134d2e84009aa3a16aa700",
                iconName: "book.fill",
                relatedTemplateID: nil
            )
        ]
    }
