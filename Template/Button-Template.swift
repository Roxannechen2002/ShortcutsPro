//定義用於顯示模板的按鈕樣式和交互邏輯


import SwiftUI

struct TemplateButton: View {
    let template: ShortcutTemplate
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: template.iconName) // 顯示模板對應的圖標
                    .font(.largeTitle)
                Text(template.name) // 顯示模板名稱
                    .font(.headline)
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
            )
        ) {
            print("Button tapped")
        }
    }
}

