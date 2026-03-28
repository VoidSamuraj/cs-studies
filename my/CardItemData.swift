//
//  CardItemData.swift
//  MemoryGame
//
//  Created by student on 08/03/2026.
//

import SwiftUI

struct CardItemData: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var color: Color
    var elements: Int
    var onButtonTap: (() -> Void)?
    }
