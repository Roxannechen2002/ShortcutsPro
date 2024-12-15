//定義分類對應的圖標（可能是通過名稱映射到 SF Symbols 的圖標設置）
import SwiftUI

// 重命名枚举以避免冲突
enum IconShortcutCategory: String, CaseIterable, Codable {
    case productivity = "Productivity"
    case aiTools = "AI Tools"
    case lifeHack = "Life Hack"
    case wellBeing = "Well Being"
    
    var iconName: String {
        switch self {
        case .productivity: return "gear"
        case .aiTools: return "briefcase.fill"
        case .lifeHack: return "wrench.fill"
        case .wellBeing: return "house.fill"
        }
    }
}
