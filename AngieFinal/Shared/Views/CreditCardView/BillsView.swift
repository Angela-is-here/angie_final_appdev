//
//  CreaditCardPageView.swift
//  Finance App Dark Theme
//
//  Created by Angie on 4/30/23.
//

import SwiftUI

struct BillsView: View {
    @StateObject var document = Document()
    
    let transactions: [(imageName: String?, payTo: String, month: Int, day: Int, amount: Int, isExpense: Bool, isSystemIcon: Bool)] = [
        (imageName: hamburgerIcon,
         payTo: "Shakeshack",
         month: 3,
         day: 24,
         amount: 21,
         isExpense: true,
         isSystemIcon: false),
        (
            imageName: hamburgerIcon,
            payTo: "Five Guys",
            month: 4,
            day: 1,
            amount: 20,
            isExpense: true,
            isSystemIcon: false),
        (
            imageName: "dollarsign.circle",
            payTo: "CHINAH",
            month: 3,
            day: 30,
            amount: 21,
            isExpense: true,
            isSystemIcon: true),
        (
            imageName: "dollarsign.circle",
            payTo: "Chipotle",
            month: 3,
            day: 27,
            amount: 55,
            isExpense: true,
            isSystemIcon: true),
        
        (
            imageName: "dollarsign.circle",
            payTo: "Mino Brasserie",
            month: 3,
            day: 24,
            amount: 55,
            isExpense: true,
            isSystemIcon: true),
        
        (
            imageName: "dollarsign.circle",
            payTo: "Circa",
            month: 3,
            day: 2,
            amount: 335,
            isExpense: true,
            isSystemIcon: true),
        
        (
            imageName: hamburgerIcon,
            payTo: "Shakeshack",
            month: 2,
            day: 22,
            amount: 25,
            isExpense: true,
            isSystemIcon: false),
        
        (
            imageName: "dollarsign.circle",
            payTo: "Xian Famous Food",
            month: 2,
            day: 2,
            amount: 13,
            isExpense: true,
            isSystemIcon: true),
        
        (
            imageName: "dollarsign.circle",
            payTo: "Starbucks",
            month: 2,
            day: 1,
            amount: 25,
            isExpense: true,
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
                    TextView(text: "Recent Food Expense", font: .title2.bold())
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


struct BillsView_Previews: PreviewProvider {
    static var previews: some View {
        BillsView()
    }
}
