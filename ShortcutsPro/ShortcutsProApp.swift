//
import SwiftUI

@main
struct ShortcutsProApp: App {
    @StateObject private var templateStore = TemplateStore() // 创建 TemplateStore 实例

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(templateStore) // 注入到环境中
        }
    }
}

