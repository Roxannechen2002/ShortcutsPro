//根據當前選擇的分類篩選模板，並顯示過濾後的模板清單
import SwiftUI

enum ShortcutCategoryType: String, CaseIterable {
    case productivity  // 生产力
    case aiTools       // AI 工具
    case lifeHack      // 生活技巧
    case wellBeing     // 健康与幸福

    var iconName: String {
        switch self {
        case .productivity: return "pencil"
        case .aiTools: return "brain"
        case .lifeHack: return "lightbulb"
        case .wellBeing: return "heart"
        }
    }
}

struct ViewTemplateList: View {
    @EnvironmentObject var templateStore: TemplateStore // 引入共享數據源
    @State private var isShowingAddTemplateSheet = false // 控制新增模板的表單彈出

    var body: some View {
        NavigationView {
            List {
                ForEach(templateStore.templates) { template in
                    HStack {
                        Image(systemName: template.iconName) // 顯示模板圖標
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(template.name) // 模板名稱
                                .font(.headline)
                            Text(template.category.rawValue) // 模板分類
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: templateStore.removeTemplate) // 支持刪除模板
            }
            .navigationTitle("Templates")
            .toolbar {
                // 新增模板按鈕
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAddTemplateSheet = true // 顯示新增模板表單
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddTemplateSheet) {
                AddTemplateView() // 呼叫新增模板表單
                    .environmentObject(templateStore) // 傳遞數據源
            }
        }
    }
}
struct ViewTemplateList_Previews: PreviewProvider {
    static var previews: some View {
        ViewTemplateList()
    }
}

