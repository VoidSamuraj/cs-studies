//
//  ColorData.swift
//  l1
//
//  Created by student on 01/03/2026.
//
import uuid
import SwiftUI

struct ColorData: Identifiable {
    var id = UUID()
    var colorName: String;
    var colorValue: Color;
    var count: Int;
}
