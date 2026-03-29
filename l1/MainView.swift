//
//  MainView.swift
//  l1
//
//  Created by student on 01/03/2026.
//
import SwiftUI

struct MainView: View {
    var body: some View {
        // Kontener nawigacji – umożliwia przechodzenie między widokami
        // Dodaje górny pasek (navigation bar) z tytułem i przyciskiem "wstecz"
        // Uwaga: w nowszym SwiftUI (iOS 16+) preferowane jest NavigationStack
        NavigationView {
            List {
                NavigationLink(destination: ContentView()) {
                    Text("Zadanie1")
                }
                
               
                NavigationLink(destination: ShapePickerView()) {
                    Text("Zadanie2")
                }
                
            }
            .navigationTitle("Wybór zadań")
        }
    }
}
#Preview {
    MainView()
}
