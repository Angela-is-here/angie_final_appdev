//
//  YourCardsView.swift
//  Finance App Dark Theme
//
//  Created by Ron Erez on 4/30/22.
//  Modified by Angie Kim on 4/30/23.
//

import SwiftUI

struct YourCardsView: View {
    
    let numActiveCard: Int
    let yourCardsFont: Font = .title3
    let numActiveCardsFont: Font = .caption
    let numActiveCardsFontWeight: Font.Weight = .thin
    var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    TextViewGeneral(
                        text: "Your Cards",
                        //text: Date.now.formatted(date: .long, time: .omitted),
                        font: yourCardsFont,
                        fontWeight: .bold,
                        color: fontColor)
                    
                    TextViewGeneral(
                        text: "You have \(numActiveCard) Active Cards",
                        font: numActiveCardsFont,
                        fontWeight: numActiveCardsFontWeight,
                        color: fontColor)
                }
                
                Spacer()

            }
            .padding()
            .background(darkBackground)
            .cornerRadius(20)
            .padding(.horizontal)
            
        }
    }

struct YourCardsView_Previews: PreviewProvider {
    static var previews: some View {
        YourCardsView(numActiveCard: 3)
    }
}
