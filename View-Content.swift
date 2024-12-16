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
                VStack {
                    // 第一個 ScrollView
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(ShortcutCategory.allCases, id: \.self) { category in
                                NavigationLink(destination: TemplateListView(selectedCategory: category)) {
                                    VStack {
                                        Image(systemName: "folder.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.blue)
                                        Text(category.rawValue)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // 第二個 ScrollView
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(ShortcutTemplate.allTemplates, id: \.id) { template in
                                TemplateButton(
                                    template: template,
                                    isSelected: selectedTemplate == template,
                                    action: {
                                        selectedTemplate = template
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }

                    // 測試項目
                    ListSection()
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

        // 測試項目分離為一個視圖
        @ViewBuilder
        func ListSection() -> some View {
            VStack {
                Text("Test Item")
            }
        }
    }
