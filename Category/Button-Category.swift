// 定義用於顯示分類的按鈕樣式和交互邏輯

import SwiftUI
struct CategoryButton: View {
    let category: ShortcutCategory
    let isSelected: Bool
    let template: ShortcutTemplate
    let action: () -> Void

    var body: some View {
        Button(action: {
            if let url = URL(string: "shortcuts://import-shortcut?url=\(template.iCloudLink.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                print("Opening URL: \(url)")
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Invalid URL")
            }
        }) {
            VStack(spacing: 8) {
                Image(systemName: category.iconName)
                    .font(.system(size: 24))
                
                Text(category.rawValue)
                    .font(.caption)
            }
            .frame(width: 80, height: 80)
            .foregroundColor(isSelected ? .white : .primary)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
}
