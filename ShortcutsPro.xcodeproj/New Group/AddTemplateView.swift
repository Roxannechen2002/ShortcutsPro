//AddTemplateView 是一個 Swift 視圖，專門用於讓用戶輸入模板詳細信息，並將其添加到模板數據中。它是一個表單（Form）樣式的視圖，包含文本輸入框、選擇器，以及保存和取消操作的按鈕。

import SwiftUI

struct AddTemplateView: View {
    @EnvironmentObject var templateStore: TemplateStore // 引用數據源
    @Environment(\.dismiss) var dismiss // 用於關閉表單視圖

    @State private var name: String = "" // 模板名稱
    @State private var iCloudLink: String = "" // 模板鏈接
    @State private var iconName: String = "" // 模板圖標
    @State private var selectedCategory: ShortcutCategory = .productivity // 預設分類

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Template Details")) {
                    TextField("Name", text: $name)
                    TextField("iCloud Link", text: $iCloudLink)
                    TextField("Icon Name (SF Symbols)", text: $iconName)
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(ShortcutCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }
            }
            .navigationTitle("Add Template")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss() // 取消並關閉表單
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        templateStore.addTemplate(
                            category: selectedCategory,
                            name: name,
                            iCloudLink: iCloudLink,
                            iconName: iconName
                        )
                        dismiss() // 保存並關閉表單
                    }
                    .disabled(name.isEmpty || iCloudLink.isEmpty || iconName.isEmpty) // 防止提交空數據
                }
            }
        }
    }
}

