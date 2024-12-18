//負責顯示分類清單的視圖，通過列表或按鈕讓用戶選擇分類。


import SwiftUI

struct CategoryListView: View {
    let categories: [ShortcutCategory] = [.productivity, .aiTools, .lifeHack, .wellBeing]

    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                NavigationLink(destination: TemplateListView(selectedCategory: category)) {
                    HStack {
                        Image(systemName: category.iconName)
                            .font(.system(size: 24))
                        Text(category.rawValue)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Categories")
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}

struct TemplateListView: View {
    let selectedCategory: ShortcutCategory
    @State private var selectedTemplate: ShortcutTemplate? = nil

    var body: some View {
        List {
            ForEach(ShortcutTemplate.allTemplates.filter { $0.category == selectedCategory }) { template in
                TemplateButton(
                    template: template,
                    isSelected: selectedTemplate == template
                ) {
                    selectedTemplate = template
                }
            }
        }
        .navigationTitle("\(selectedCategory.rawValue) Templates")
    }
}

