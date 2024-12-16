import SwiftUI

class Shortcut: Identifiable {
    var id = UUID()
    var name: String
    var shortcutDescription: String
    var category: ShortcutCategory
    var isFavorite: Bool
    var createdDate: Date
    var template: ShortcutTemplate? // 新增 template 屬性

        init(name: String, shortcutDescription: String, category: ShortcutCategory, isFavorite: Bool = false, template: ShortcutTemplate? = nil) {
            self.name = name
            self.shortcutDescription = shortcutDescription
            self.category = category
            self.isFavorite = isFavorite
            self.createdDate = Date()
            self.template = template
        }
    }
    
