//
//  ItemDetail.swift
//  Finance App Dark Theme
//
//  Created by Angie Kim on 5/1/23.
//

import Foundation
//
//  ItemDetail.swift
//

import SwiftUI

struct ItemDetail: View {
    var item:ItemModel
    
    
    @EnvironmentObject var document:Document
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            HStack {
                Text("label: ")
                Text(item.label)
                Spacer()
            }
            HStack {
                Text("assetName: ")
                Text(item.assetName)
                Spacer()
            }
            HStack {
                Text("systemName: ")
                Text(item.systemName)
                Spacer()
            }

                Button("Delete") {
                    document.deleteItem(id: item.id)
                    dismiss();
                }
            }

        }
    }
    

