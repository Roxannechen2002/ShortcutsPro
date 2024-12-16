// 定義用於顯示分類的按鈕樣式和交互邏輯

import SwiftUI
struct CategoryButton: View {
    let category: ShortcutCategory
    let isSelected: Bool
    let template: ShortcutTemplate
    let action: () -> Void
    
    @Environment(\.openURL) var openURL // 正確引入 openURL
    
    var body: some View {
         Button(action: {
             print("按鈕被點擊了")
             if let url = URL(string: "https://www.icloud.com/shortcuts/2dfd3256100a4fea97b81a11c3d47cf4") {
                 openURL(url) // 使用 openURL 而非 UIApplication.shared
             } else {
                 print("URL 無效或格式錯誤")
             }
         }) {
             VStack {
                 Image(systemName: "link.circle.fill")
                     .font(.system(size: 30))
                     .foregroundColor(.blue)
                 Text("Download")
                     .font(.headline)
                     .foregroundColor(.blue)
             }
             .frame(width: 80, height: 80)
             .background(Color.blue.opacity(0.1))
             .cornerRadius(12)
         }
     }
 }
