//顯示單個模板的詳細信息頁面，例如模板名稱、描述和下載鏈接

import SwiftUI
import UIKit

struct TemplateDetailView: View {
    let template: ShortcutTemplate

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(template.name)
                .font(.largeTitle)
                .padding(.bottom, 10)

            HStack {
                Image(systemName: template.category.iconName)
                Text("Category: \(template.category.rawValue)")
            }
            .font(.title2)

            Button(action: {
                if let encodedLink = template.iCloudLink.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                   let url = URL(string: "shortcuts://import-shortcut?url=\(encodedLink)") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }) {
                HStack {
                    Image(systemName: "icloud.and.arrow.down")
                    Text("Download from iCloud")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Template Details")
    }
}

struct ViewTemplateButton_Previews: PreviewProvider {
    static var previews: some View {
        TemplateButton(
            template: ShortcutTemplate(
                category: .productivity,
                name: "Sample Template",
                iCloudLink: "https://example.com",
                iconName: "envelope.fill", // 预览时使用的图标
                relatedTemplateID: nil // 显式传递 nil
            ),
                       isSelected: true // 新增 isSelected 參數，設置為 true 或 false
                   ) {
                       print("Button tapped")
                   }
               }
           }


