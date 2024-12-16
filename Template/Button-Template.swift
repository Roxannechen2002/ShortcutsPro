//定義用於顯示模板的按鈕樣式和交互邏輯


import SwiftUI

struct TemplateButton: View {
    let template: ShortcutTemplate
    let isSelected: Bool 
    let action: () -> Void

    var body: some View {
            Button(action: {
                action()
            }) {
            VStack {
                Image(systemName: template.iconName) // 顯示模板對應的圖標
                    .font(.system(size: 30)) // 調整圖標大小
                Text(template.name) // 顯示模板名稱
                    .font(.footnote) // 調整文字大小
                Text("Download") // 顯示動作提示
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

struct TemplateButton_Previews: PreviewProvider {
    static var previews: some View {
        TemplateButton(
            template: ShortcutTemplate(
                category: .productivity,
                name: "Sample Template",
                iCloudLink: "https://example.com",
                iconName: "envelope.fill", // 預覽使用的圖標
                relatedTemplateID: nil // 或者提供一個 UUID，例如 UUID()
            ),
                        isSelected: true // 傳遞 isSelected 參數
                    ) {
                        print("Button tapped")
                    }
                }
            }

