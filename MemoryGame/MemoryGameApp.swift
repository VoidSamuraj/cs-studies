
import SwiftUI

@main
struct MemoryGameApp: App {
    
    // Obiekt klasy zgodnej z ObservableObject
    @StateObject private var viewModel = MemoGameViewModel()
    
    var body: some Scene {
        WindowGroup { // WindowGroup tworzy okno/widok główny aplikacji
            ContentView(viewModel: viewModel)
        }
    }
}
