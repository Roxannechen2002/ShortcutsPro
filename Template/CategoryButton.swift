import SwiftUI

struct CategoryButton: View {
    let category: ShortcutCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: category.iconName)
                    .font(.system(size: 24))
                
                Text(category.rawValue)
                    .font(.caption)
            }
            .frame(width: 80, height: 80)
            .foregroundColor(isSelected ? .white : .primary)
            .background(isSelected ? Color.blue : Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
} 