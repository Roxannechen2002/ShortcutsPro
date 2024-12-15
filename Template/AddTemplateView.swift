//AddTemplateView 是一個 Swift 視圖，專門用於讓用戶輸入模板詳細信息，並將其添加到模板數據中。它是一個表單（Form）樣式的視圖，包含文本輸入框、選擇器，以及保存和取消操作的按鈕。


import SwiftUI

struct AddTemplateView: View {
    @EnvironmentObject var templateStore: TemplateStore // 模板數據管理
    @Environment(\.dismiss) var dismiss // 控制表單視圖的關閉
    
    @State private var name: String = "" // 模板名稱
    @State private var iCloudLink: String = "" // iCloud 連結
    @State private var iconName: String = "" // 圖標名稱
    @State private var selectedCategory: ShortcutCategory = .productivity // 預設分類
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Template Details")) {
                    TextField("Name", text: $name) // 輸入模板名稱
                    TextField("iCloud Link", text: $iCloudLink) // 輸入模板連結
                    TextField("Icon Name (SF Symbols)", text: $iconName) // 輸入圖標名稱
                    Picker("Category", selection: $selectedCategory) { // 選擇分類
                        ForEach(ShortcutCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }
            }
            .navigationTitle("Add Template")
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newTemplate = ShortcutTemplate(
                            category: selectedCategory,
                            name: name,
                            iCloudLink: iCloudLink,
                            iconName: iconName,
                            relatedTemplateID: nil // 假設可以為 nil
                        )
                        templateStore.addTemplate(template: newTemplate)
                        dismiss()
                    }
                    .disabled(name.isEmpty || iCloudLink.isEmpty || iconName.isEmpty)
                }
            })
        }
    }
}
