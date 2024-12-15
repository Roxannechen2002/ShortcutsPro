//管理所有模板的數據源，支持動態數據操作（例如新增、刪除、加載）。

import SwiftUI

class TemplateStore: ObservableObject {
    @Published var templates: [ShortcutTemplate] = [] // 動態模板數據

    init() {
        loadInitialTemplates() // 初始數據加載
    }

    // 加載靜態初始模板
    func loadInitialTemplates() {
        templates = [
            ShortcutTemplate(
                category: .productivity,
                name: "Email Schedule to Yourself",
                iCloudLink: "https://www.icloud.com/shortcuts/2dfd3256100a4fea97b81a11c3d47cf4",
                iconName: "envelope.fill",
                relatedTemplateID: nil // 没有相关模板时设置为 nil
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
                category: .productivity,
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

    // 新增模板
    func addTemplate(template: ShortcutTemplate) {
        templates.append(template) // 將新的模板加入到列表
    }


    // 刪除模板
    func removeTemplate(at offsets: IndexSet) {
        templates.remove(atOffsets: offsets)
    }
}


