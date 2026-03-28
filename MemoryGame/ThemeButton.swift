
import SwiftUI

enum Theme: CaseIterable {
    case motyw1, motyw2, motyw3
    
    var title: String {
        switch self {
        case .motyw1: return "Motyw 1"
        case .motyw2: return "Motyw 2"
        case .motyw3: return "Motyw 3"
        }
    }
    
    var color: Color {
        switch self {
        case .motyw1: return .orange
        case .motyw2: return .green
        case .motyw3: return .blue
        }
    }
    // SF Symbols - web albo Shift + Command + L
    var icon: String {
        switch self {
        case .motyw1: return "moon.stars"
        case .motyw2: return "tortoise"
        case .motyw3: return "basketball"
        }
    }
    
    var emojis: [String] {
        switch self {
        case .motyw1: return ["🎃", "👻", "🕷️", "💀", "🕸️", "🦇", "😈", "🍭", "💕", "😔", "😭"]
        case .motyw2: return ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
        case .motyw3: return ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🎱"]
        }
    }
    
//    var numberOfPairs: Int {
//        switch self {
//        case .motyw1: return 4
//        case .motyw2: return 5
//        case .motyw3: return 7
//        }
//    }
}

struct ThemeButton: View {
    let theme: Theme
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: theme.icon)
                Text(theme.title)
            }
            .font(.headline)
        }

    }
}

#Preview {
    ThemeButton(theme: .motyw2) { }
}
