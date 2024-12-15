//顯示所有模板的列表，可能根據分類或用戶操作進行篩選
import SwiftUI

let shortcutTemplates: [ShortcutTemplate] = [
    ShortcutTemplate(
        category: .productivity,
        name: "Email Schedule to Yourself",
        iCloudLink: "https://www.icloud.com/shortcuts/2dfd3256100a4fea97b81a11c3d47cf4"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
        iconName: "envelope.fill", // 信封图标表示邮件相关
        relatedTemplateID: nil // 明确表示此模板没有关联模板
    ),
    ShortcutTemplate(
        category: .aiTools,
        name: "Summarize Text Perplexity",
        iCloudLink: "https://www.icloud.com/shortcuts/1849854a41be449081c953b5c3d24a90"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
        iconName: "brain.head.profile", // 大脑图标表示 AI 分析
        relatedTemplateID: nil // 明确表示无关联模板
    ),
    ShortcutTemplate(
        category: .aiTools,
        name: "GPT Writing Tools",
        iCloudLink: "https://www.icloud.com/shortcuts/dd234dbd5d8442e8927e320fa3b02071"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
        iconName: "pencil.and.outline", // 铅笔图标表示写作工具
        relatedTemplateID: nil
    ),
    ShortcutTemplate(
        category: .lifeHack,
        name: "Check my app subscriptions",
        iCloudLink: "https://www.icloud.com/shortcuts/52f49a5b1f3047119c113528dc8c99fc"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
        iconName: "list.bullet.rectangle.portrait", // 列表图标表示检查订阅
        relatedTemplateID: nil
    ),
    ShortcutTemplate(
        category: .productivity,
        name: "Daily Screenshot Cleaner",
        iCloudLink: "https://www.icloud.com/shortcuts/a7b474f365c243a6ae0bf14b79891a2e"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
        iconName: "camera.viewfinder", // 相机图标表示截图清理
        relatedTemplateID: nil
    ),
    ShortcutTemplate(
        category: .wellBeing,
        name: "Word of the Day",
        iCloudLink: "https://www.icloud.com/shortcuts/3e8d41fe89134d2e84009aa3a16aa700"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
        iconName: "book", // 图书图标表示每日一词
        relatedTemplateID: nil
    )
]

struct ViewTemplateListView: View {
    @State private var selectedCategory: ShortcutCategory? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    CategoryButton(
                        category: .productivity,
                        isSelected: selectedCategory == .productivity,
                        template: shortcutTemplates.first { $0.category == .productivity }!,
                        action: { selectedCategory = .productivity }
                    )
                    CategoryButton(
                        category: .aiTools,
                        isSelected: selectedCategory == .aiTools,
                        template: shortcutTemplates.first { $0.category == .aiTools }!,
                        action: { selectedCategory = .aiTools }
                    )
                    CategoryButton(
                        category: .lifeHack,
                        isSelected: selectedCategory == .lifeHack,
                        template: shortcutTemplates.first { $0.category == .lifeHack }!,
                        action: { selectedCategory = .lifeHack }
                    )
                    CategoryButton(
                        category: .wellBeing,
                        isSelected: selectedCategory == .wellBeing,
                        template: shortcutTemplates.first { $0.category == .wellBeing }!,
                        action: { selectedCategory = .wellBeing }
                    )
                }
                .padding()

                List(filteredTemplates, id: \.name) { template in
                    VStack(alignment: .leading) {
                        Text(template.name)
                            .font(.headline)
                        Text("Category: \(template.category.rawValue)")
                            .font(.subheadline)
                        Button(action: {
                            if let url = URL(string: "shortcuts://import-shortcut?url=\(template.iCloudLink)") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Text("立即下載")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Shortcut Templates")
        }
    }

    var filteredTemplates: [ShortcutTemplate] {
        if let category = selectedCategory {
            return shortcutTemplates.filter { $0.category == category }
        } else {
            return shortcutTemplates
        }
    }
}

struct TemplateListView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateListView(selectedCategory: .productivity) // 提供一个默认分类
    }
}





