// 定義快捷指令的分類枚舉，包含分類名稱和對應的圖標

import SwiftUI

enum ShortcutCategory: String, CaseIterable, Codable {
    case productivity
    case aiTools
    case lifeHack
    case wellBeing
    
    var id: String { rawValue }
    
    var iconName: String {
        switch self {
        case .productivity: return "briefcase.fill"
        case .aiTools: return "gear"
        case .lifeHack: return "wrench.fill"
        case .wellBeing: return "house.fill"
        }
    }
}
