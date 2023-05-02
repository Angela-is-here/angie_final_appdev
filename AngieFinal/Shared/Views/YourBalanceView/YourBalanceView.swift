
import SwiftUI

let yourCardsFont: Font = .title3

struct YourBalanceView: View {

    @State var Stack = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $Stack) {
            
            ZStack {
                darkBackground
                    .ignoresSafeArea()
                
                VStack {
                    HeaderYourBalanceView()
                    BalanceSubView()
                    YourBalanceAmountView(
                        month: 6,
                        day: 14,
                        year: 2022,
                        amount: 2780.05,
                        percentage: 15,
                        isUp: true)
                    
                    YourBalanceActionsView()
                    ActivitiesOfTheWeekHeader()
                    
                    MonthlyExpensesView()
                    
                    Spacer()
                }
            }
        }
    }
}

struct ActivitiesOfTheWeekHeader: View {
    var body: some View {
        HStack {
            Text("Activities")
                .foregroundColor(white)
                .font(.title3.weight(.semibold))

            Spacer()
            TextView(text: "This Week", font: .caption)
                .padding(7)
                .padding(.horizontal)
                .background(darkBackground2)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}



struct YourBalanceActionsView: View {
    let actionList: [(iconName: String, name: String, color: Color)] = [
        (iconName: "building.2", name: "Rent", color: .pink),
        (iconName: "cart", name: "Shopping", color: .green),
        (iconName: "heart.fill", name: "Food", color: .yellow),
        (iconName: "dollarsign.square", name: "All", color: .blue)
    ]
    var body: some View {
        HStack {
            
            NavigationLink(destination: RentView()){
                ActionView(
                    iconName: actionList[0].iconName,
                    color: actionList[0].color,
                    name: actionList[0].name)
            }
            
            Spacer()
            NavigationLink(destination: OnlineShoppingView()){
                ActionView(
                    iconName: actionList[1].iconName,
                    color: actionList[1].color,
                    name: actionList[1].name)
            }
            Spacer()
            NavigationLink(destination: BillsView()){
                ActionView(
                    iconName: actionList[2].iconName,
                    color: actionList[2].color,
                    name: actionList[2].name)
            }
            Spacer()
            NavigationLink(destination: AllView()){
                ActionView(
                    iconName: actionList[3].iconName,
                    color: actionList[3].color,
                    name: actionList[3].name)
            }

        }
        .padding()
    }
}

struct ActionView: View {
    let iconName: String
    let color: Color
    let name: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .foregroundColor(color)
                .frame(width: 50, height: 50)
                .background(darkBackground2)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            TextView(text: name, font: .caption)
        }
    }
}



struct HeaderYourBalanceView: View {
    
    @State var Stack = NavigationPath()
    
    let dim: CGFloat = 50
    var body: some View {
        HStack {
            NavigationLink(destination: CreditCardPageView()) {
                Text("My Cards")
            }
            Spacer()
            AvatarDefaultView(dim: 30)
        }.padding()
        
    }
}

struct YourBalanceAmountView: View {
    let month: Int
    let day: Int
    let year: Int
    let amount: Double
    let percentage: Int
    let isUp: Bool
    
    var body: some View {
            HStack {
                VStack(spacing: 10) {
                
                if month >= 1 && month <= 12 {
                    let cal = Calendar.current
                    let monthName = cal.monthSymbols[month-1]
                    HStack {
                        TextViewGeneral(
                            text: Date.now.formatted(date: .long, time: .omitted),
                            font: yourCardsFont,
                            fontWeight: .bold,
                            color: fontColor
                        )
                    }
                }
                
                HStack {
                    Text("$\(amount, specifier: "%.2f")")
                        .foregroundColor(white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    TextView(text: "\(percentage)%", font: .caption)
                    
                    
                    let imageName = isUp ? "arrow.up" : "arrow.down"
                    Image(systemName: imageName)
                        .foregroundColor(fontColor)
                        .font(.caption)
                }
            }
            
        }.padding()
            .background(darkBackground2)
            .cornerRadius(20)
            .padding(.horizontal)
    }
}




struct AvatarDefaultView: View {
    let dim: CGFloat
    var body: some View {
        NavigationView {
            NavigationLink{
                AboutView()
            } label: {
                Text("About")
            }
            .background(darkBackground2)
            .buttonStyle(.borderedProminent)
        }
        .frame(width: 70.0, height: 30.0)
    }
}



struct BalanceSubView: View {
    var body: some View {
        HStack {
            TextView(text: "Your Balance", font: .title)
            Spacer()
        }.padding()
    }
}

struct MonthlyExpensesView: View {
    let barData: [(name: String,percentage: CGFloat)] = [
        (name: "Jan", percentage: 0.50),
        (name: "Feb", percentage: 0.33),
        (name: "Mar", percentage: 0.33),
        (name: "Apr", percentage: 0.33/2),
        (name: "May", percentage: 0.33/2),
        (name: "Jun", percentage: 0.33/2)
    ]

    var body: some View {
        HStack {
            ForEach(barData.indices, id: \.self) { i in
                FillBarView(name: barData[i].name, percentage: barData[i].percentage)
            }
        }.padding()
    }
}

struct YourBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        YourBalanceView()
    }
}

