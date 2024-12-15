import SwiftUI
import SwiftData

@Model
class Shortcut: Identifiable {  // 添加 Identifiable
    var id = UUID()  // 添加唯一識別符
    var name: String
    var shortcutDescription: String
    var category: ShortcutCategory
    var isFavorite: Bool
    var createdDate: Date
    
    init(name: String, shortcutDescription: String, category: ShortcutCategory, isFavorite: Bool = false) {
        self.name = name
        self.shortcutDescription = shortcutDescription
        self.category = category
        self.isFavorite = isFavorite
        self.createdDate = Date()
    }
}
