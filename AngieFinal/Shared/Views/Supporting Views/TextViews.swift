//
//  TextViews.swift
//  Finance App Dark Theme
//
//  Created by Ron Erez on 4/30/22.
//  Modified by Angie Kim on 4/30/23.
//

import SwiftUI


struct TextViewGeneral: View {
    let text: String
    let font: Font
    let fontWeight: Font.Weight
    let color: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(font)
            .fontWeight(fontWeight)
            
    }
}

struct TextView: View {
    let text: String
    let font: Font
    
    var body: some View {
        Text(text)
            .foregroundColor(fontColor)
            .font(font)
            
    }
}

struct TextViewWhite: View {
    let text: String
    let font: Font
    let fontWeight: Font.Weight
    
    var body: some View {
        Text(text)
            .font( font)
            .fontWeight( fontWeight)
            .foregroundColor(white)
            .padding(.horizontal)
    }
}


