//
//  PrivacyView.swift
//  Finance App Dark Theme
//
//  Created by Angie Kim on 5/1/23.
//

import SwiftUI

struct PrivacyList: Identifiable {
    var id: String
    var isSubscribed = false
}

struct PrivacyView: View {
    @State var lists = [
        PrivacyList(id: "Share Card Expenses with app", isSubscribed: true),
        PrivacyList(id: "News Flashes", isSubscribed: true),
        PrivacyList(id: "Special Offers", isSubscribed: true)
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    ForEach($lists) { $list in
                        Toggle(list.id, isOn: $list.isSubscribed)
                            .tint(.blue)
                    }
                }
                
                Section {
                    Toggle("Agree to all", sources: $lists, isOn: \.isSubscribed)
                        .tint(.purple)
                }
            }
            .navigationTitle("Privacy Settings")
        }
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
