
import SwiftUI

struct ContentView: View {
    let title: String = "Memo"

    // Obserwuje ViewModel – gdy dane się zmienią, widok automatycznie się odświeży
    // @ObservedObject bo ViewModel jest TWORZONY wyżej (w App), a tu tylko przekazany
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.largeTitle)
            Group { //Grupa aby zastosować styl
                mainCardDisplay   // główna karta (podgląd wybranej)
                cardDisplay       // siatka wszystkich kart
                Spacer()          // wypycha przyciski na dół ekranu
                shuffleButton     // przycisk tasowania
                buildThemeButtons // przyciski zmiany motywu
            }
            .foregroundStyle(viewModel.themeColor)
        }
        .padding()
        
    }
}
//To samo jakby metody dać w srodku powyższego struct
extension ContentView {
    private var shuffleButton: some View {
        Button {
            withAnimation(.spring) {
                viewModel.shuffle()
            }
        } label: {
            Text("SHUFFLE")
        }
    }
    
    private var mainCardDisplay: some View {
        Group {
             // Jeśli istnieje wybrana karta
            if let mainCard = viewModel.mainCard {
                CardView(card: mainCard)
                    .aspectRatio(0.65, contentMode: .fit)
                    .frame(maxHeight: 300)
            } else {
                Text("??")
                    .font(.headline)
            }
        }
        .padding(.bottom)
    }
    
    private var buildThemeButtons: some View {
        HStack {
            let themes = Theme.allCases
            
            ForEach(themes.indices, id: \.self) { index in
            // po wartosciach : ForEach(themes, id: \.self) 
                ThemeButton(theme: themes[index]) {
                    let selectedTheme = themes[index]
                    viewModel.changeTheme(to: selectedTheme)
                }

                if index < themes.count - 1 {
                    Spacer()
                }
            }
        }
    }
    
    private var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) { // .adaptive - tyle kolumn ile się zmieści, każda min. 85pt szerokości
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .padding(4)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
