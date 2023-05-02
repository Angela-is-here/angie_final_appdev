//
//  AboutView.swift
//  Finance App Dark Theme
//
//  Created by Ron Erez on 4/30/22.
// https://www.hackingwithswift.com/articles/237/complete-guide-to-sf-symbols
// https://www.youtube.com/watch?v=gACQ7aSjqoM
// Reinstall simulators :
// https://stackoverflow.com/questions/47445797/unable-to-boot-device-because-it-cannot-be-located-on-disk
// Image color picker:
// https://imagecolorpicker.com/en

import SwiftUI

struct AboutView: View {

    var body: some View {
        NavigationStack{
            ZStack {
                darkBackground
                    .ignoresSafeArea()
                VStack(alignment:.leading) {
                    
                    xView()
                    
                    AvatarView()
                    
                    Spacer()
                    
                    ChoicesView()
                    
                    Spacer()
                }
            }
        }
    }
}

struct ChoicesView: View {
    
    let dataArray: [(String,String, String?)] = [
        (title:"Rent", systemImage: "building.2", description: "Rent Icon"),
        (title:"Online Shopping", systemImage: "cart", description: "Online Shopping Icon"),
        (title:"Food", systemImage: "heart.fill", description: "Food Icon"),
        (title:"Privacy", systemImage: "lock", description: "Privacy Icon"),
        (title:"Settings", systemImage: "wrench.and.screwdriver", description: "Settings Icon")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            NavigationLink(destination: RentView()) {
                SingleChoiceView(text: dataArray[0].0, systemImage: dataArray[0].1, description: dataArray[0].2)
            }
            NavigationLink(destination: OnlineShoppingView()) {
                SingleChoiceView(text: dataArray[1].0, systemImage: dataArray[1].1, description: dataArray[1].2)
            }
            NavigationLink(destination: BillsView()) {
                SingleChoiceView(text: dataArray[2].0, systemImage: dataArray[2].1, description: dataArray[2].2)
            }
            NavigationLink(destination: PrivacyView()) {
                SingleChoiceView(text: dataArray[3].0, systemImage: dataArray[3].1, description: dataArray[3].2)
            }
            SingleChoiceView(text: dataArray[4].0, systemImage: dataArray[4].1, description: dataArray[4].2)
        }
    }
}

struct SingleChoiceView: View {
    let text: String
    let systemImage: String
    let description: String?
    var body: some View {
        Label( text, systemImage: systemImage)
            .font(.headline)
            .foregroundColor(fontColor)
            .padding(.horizontal)
            .labelStyle(SpacedLabelStyle())
            //.symbolRenderingMode(.hierarchical)
            .accessibilityLabel(description ?? text)
    }
}

struct SpacedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 25) {
            configuration.icon
                .imageScale(.large)
            configuration.title
        }
    }
}

struct AvatarView: View {
    
    var body: some View {
            VStack(alignment: .leading) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .padding(0.004)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundColor(fontColor)
                    .background(darkBackground2)
                    .clipShape(Circle())
                
                TextView(text: "Angie Kim", font: .title)
                    .padding(.vertical, 5.0)
                TextView(text: "New York, NY", font: .headline)
            }.padding()
    }
}

struct xView: View {
    
    var body: some View {
        HStack {
            Spacer()
        }
    }
}



struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
