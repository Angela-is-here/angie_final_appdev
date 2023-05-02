//
//  AddCardView.swift
//  Finance App Dark Theme
//
//  Created by Angie Kim on 5/1/23.
//

//
//  ContentView.swift
//

import SwiftUI

struct AddCardView: View {
    @EnvironmentObject var document:Document
    
    var body: some View {
        ZStack{
            NavigationView {
                List {
                    // Display in reverse order to see new additions first
                    ForEach(document.items.reversed()) { item in
                        NavigationLink(
                            destination:
                                // ItemDetail(item: item)
                            // UpdateImageView(item: item)
                            UpdateImageView(action: "Update",
                                            id: item.id,
                                            label: item.label,
                                            assetName: item.assetName,
                                            systemName: item.systemName
                                           )
                            
                        )
                        {
                            ItemRow(item: item)
                        }
                    }
                }
                .navigationTitle("Card list")
                
                .navigationBarItems(
                    trailing:
                        NavigationLink(
                            destination:
                                AddImageView()
                        )
                    {
                        Text("Manage Your Card")
                        
                    }
                )
            }
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Document()
        AddCardView()
            .environmentObject(model)
    }
}

