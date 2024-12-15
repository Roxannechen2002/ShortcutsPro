// 定義模板的數據結構（如 ShortcutTemplate），描述每個模板的屬性，例如名稱、分類、鏈接等。

import Foundation

// 定义模板的属性和动态功能
struct ShortcutTemplate: Identifiable {
    let id = UUID() // 唯一标识符
    let category: ShortcutCategory // 模板的分类
    let name: String // 模板的名字
    let iCloudLink: String // 模板的 iCloud 链接
    let iconName: String // 模板的图标
    let relatedTemplateID: UUID? // 关联模板的 ID（可选）

    // 动态属性：返回百分号编码的链接
    var encodedLink: String {
        self.iCloudLink.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
    }
}


