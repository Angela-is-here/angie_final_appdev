//
//  TopView.swift
//  Finance App Dark Theme
//
//  Created by Ron Erez on 4/30/22.
//  Modified by Angie Kim on 4/30/23.
//

import SwiftUI

struct TopView: View {
    let dim: CGFloat = 50
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .font(.body.weight(.heavy))
                .frame(width: dim, height: dim)
                .foregroundColor(fontColor)
                
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .font(.body.weight(.heavy))
                .frame(width: dim, height: dim)
                .foregroundColor(fontColor)
                .rotationEffect(.degrees(90))

        }
        .padding()
        .background(darkBackground)        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
