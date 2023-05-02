//
//  FillBarView.swift
//  Finance App Dark Theme (iOS)
//
//  Created by Ron Erez on 5/1/22.
//  Modified by Angie Kim on 4/30/23.
//

import SwiftUI

struct FillBarView: View {
    let barWidth: CGFloat = 8
    let name: String
    let percentage: CGFloat
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(name)
                    .foregroundColor(fontColor)
                    .font(.caption)
                
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill( darkBackground3)
                        .frame(width: barWidth, height: .infinity)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(purple2)
                        .frame(width: barWidth, height: geometry.size.height*percentage)

                }
                    
            }
        }
    }
}

struct FillBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            darkBackground.ignoresSafeArea()
            FillBarView(name: "Jan", percentage: 0.67)
        }
    }
}
