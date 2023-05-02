//
//  CreaditCardPageView.swift
//  Finance App Dark Theme
//
//  Created by Angie on 4/30/23.
//

import SwiftUI

struct RentView: View {
    @StateObject var document = Document()
    
    let transactions: [(imageName: String?, payTo: String, month: Int, day: Int, amount: Int, isExpense: Bool, isSystemIcon: Bool)] = [
        (imageName: paypalIcon,
         payTo: "April Rent",
         month: 3,
         day: 20,
         amount: 2010,
         isExpense: true,
         isSystemIcon: false),
        (
            imageName: paypalIcon,
            payTo: "March Rent",
            month: 2,
            day: 28,
            amount: 2010,
            isExpense: false,
            isSystemIcon: false),
        (
            imageName: paypalIcon,
            payTo: "Feburary Rent",
            month: 1,
            day: 20,
            amount: 2110,
            isExpense: true,
            isSystemIcon: false),
        (
            imageName: "dollarsign.circle",
            payTo: "January Rent",
            month: 0,
            day: 24,
            amount: 2110,
            isExpense: false,
            isSystemIcon: true)
    ]
    

    var body: some View {
        NavigationStack{
            ZStack {
                darkBackground
                    .ignoresSafeArea()
               
                VStack(alignment: .center) {
                    
                    Spacer()
                    
                    
                    
                    VStack(alignment: .leading) {
                    TextView(text: "Recent Rent Payment", font: .title2.bold())
                        .padding()
                    Spacer()
                    ScrollView {
                        VStack(spacing: 10) {
                            
                            ForEach(0 ..< transactions.count) { i in
                                TransactionView(
                                    imageName: transactions[i].imageName,
                                    payTo: transactions[i].payTo,
                                    month: transactions[i].month,
                                    day: transactions[i].day,
                                    amount: transactions[i].amount,
                                    isExpense: transactions[i].isExpense,
                                    isSystemIcon: transactions[i].isSystemIcon)
                            }
                        }
                        }
                    }
                }
            }
        }
    }
}


struct RentView_Previews: PreviewProvider {
    static var previews: some View {
        RentView()
    }
}
