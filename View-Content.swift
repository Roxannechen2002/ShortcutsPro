// ：應用的主視圖，用於組合 Category 和 Template 模組的內容，並將 AppState 注入子視圖，形成整個應用的骨架
import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedCategory: ShortcutCategory?
    @State private var selectedTemplate: ShortcutTemplate?
    private var shortcuts: [Shortcut] = [] // 手動初始化

    var filteredShortcuts: [Shortcut] {
        shortcuts.filter { shortcut in
            let matchesSearch = searchText.isEmpty ||
                shortcut.name.localizedCaseInsensitiveContains(searchText)
            let matchesCategory = selectedCategory == nil ||
                shortcut.category == selectedCategory
            let matchesTemplate = selectedTemplate == nil ||
                shortcut.template == selectedTemplate
            return matchesSearch && matchesCategory && matchesTemplate
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(ShortcutCategory.allCases, id: \.self) { category in
                        CategoryButton(
                            category: category,
                            isSelected: selectedCategory == category
                        ) {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(ShortcutTemplate.allCases, id: \.self) { template in
                        TemplateButton(
                            template: template,
                            isSelected: selectedTemplate == template
                        ) {
                            selectedTemplate = template
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            List {
                // 簡單的測試項目
                Text("Test Item")
            }
            .navigationTitle("快捷指令庫")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // 測試按鈕
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
