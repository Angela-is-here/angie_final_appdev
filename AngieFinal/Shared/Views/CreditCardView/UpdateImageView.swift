//
//  UpdateImageView.swift
//  ImageEditDemo
//
//  Created by jht2 on 3/3/22.
//

import SwiftUI

struct UpdateImageView: View {
    var action: String // "Update" or "Add"
    var id: UUID
    
    @State var label:String = ""
    @State var assetName:String = ""
    @State var systemName:String = ""
    
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var document:Document
    
    var body: some View {
        VStack {
            HStack {
                Button("Update") {
                    print("UpdateImageView Update")
                    document.updateItem(id: id, label: label,
                        assetName: assetName,
                        systemName: systemName
                    )
                    dismiss()
                }
                Spacer()
                Button("Delete") {
                    document.deleteItem(id: id)
                    dismiss();
                }
            }.padding(10)
            Form {
                TextField("Card Name", text: $label)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Card Number", text: $assetName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Expiration Date", text: $systemName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
        }
    }
}

struct UpdateImageView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateImageView(action: "action", id: UUID())
    }
}
