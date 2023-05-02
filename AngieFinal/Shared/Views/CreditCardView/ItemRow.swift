//
//  ItemRow.swift
//

import SwiftUI


struct ItemRow: View {
    var item:ItemModel

    var body: some View {
        HStack {
            Text(item.label)
            Spacer()
        }
    }
}


