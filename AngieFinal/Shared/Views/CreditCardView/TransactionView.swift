//
//  TransactionView.swift
//  Finance App Dark Theme
//
//  Created by Ron Erez on 4/30/22.
//  Modified by Angie Kim on 4/30/23.
//

import SwiftUI

struct TransactionView: View {
    let imageName: String?
    let payTo: String
    let month: Int
    let day: Int
    let amount: Int
    let isExpense: Bool
    let isSystemIcon: Bool
    var body: some View {
        HStack {
            if let imageName = imageName {
                
                if !isSystemIcon {
                    Image(imageName)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .foregroundColor(fontColor)
                        .frame(width: 30, height: 30)
                } else {
                    Image(systemName: imageName)
                        .foregroundColor(fontColor)
                        .font(.title.bold())
                }
            }
            VStack(alignment: .leading, spacing: 7) {
                
                TextView(
                    text: payTo,
                    font: .title2)

                if month >= 0 && month <= 12 {
                    let cal = Calendar.current
                    let monthName = cal.monthSymbols[month]
                    
                    TextView(
                        text: "\(monthName) \(day)",
                        font: .subheadline)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Text("\(isExpense ? "-" : "+")$\(amount)")
                .foregroundColor(fontColor)
                .font(.caption)
        }
        .padding()
        .background(darkBackground2)
        .cornerRadius(20)
        .padding(.horizontal)

    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView(
            imageName: "bolt",
            payTo: "KFC",
            month: 3,
            day: 20,
            amount: 20,
            isExpense: true,
            isSystemIcon: true
        )
    }
}
