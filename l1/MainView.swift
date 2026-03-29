//
//  MainView.swift
//  l1
//
//  Created by student on 01/03/2026.
//
import SwiftUI

struct MainView: View {
    var body: some View {
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
